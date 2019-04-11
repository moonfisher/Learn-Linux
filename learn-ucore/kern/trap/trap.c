#include "defs.h"
#include "mmu.h"
#include "memlayout.h"
#include "clock.h"
#include "trap.h"
#include "x86.h"
#include "stdio.h"
#include "assert.h"
#include "console.h"
#include "vmm.h"
#include "swap.h"
#include "kdebug.h"
#include "unistd.h"
#include "syscall.h"
#include "error.h"
#include "sched.h"
#include "sync.h"
#include "proc.h"

#define TICK_NUM 100

static void print_ticks()
{
    cprintf("%d ticks\n", TICK_NUM);
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}

/* *
 * Interrupt descriptor table:
 *
 * Must be built at run time because shifted function addresses can't
 * be represented in relocation records.
 * */
static struct gatedesc idt[256] = {{0}};    // 0xC0158780

/* 0xC0155560
{
    pd_lim = 0x7FF,
    pd_base = 0xC0158780
}
*/
#if ASM_NO_64
static struct pseudodesc idt_pd = {sizeof(idt) - 1, (uintptr_t)idt};
#else
static struct pseudodesc idt_pd;
#endif

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void idt_init(void)
{
    extern uintptr_t __vectors[];
    int i = 0;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++)
    {
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
    
    // T_SYSCALL = int 0x80，80 中断设置的权限是 DPL_USER，用户进程可以执行跳转执行的代码，否则没权限
    SETGATE(idt[T_SYSCALL], 1, GD_KTEXT, __vectors[T_SYSCALL], DPL_USER);
    
    // set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
    
    lidt(&idt_pd);
}

static const char *trapname(int trapno)
{
    static const char * const excnames[] = {
        "Divide error",
        "Debug",
        "Non-Maskable Interrupt",
        "Breakpoint",
        "Overflow",
        "BOUND Range Exceeded",
        "Invalid Opcode",
        "Device Not Available",
        "Double Fault",
        "Coprocessor Segment Overrun",
        "Invalid TSS",
        "Segment Not Present",
        "Stack Fault",
        "General Protection",
        "Page Fault",
        "(unknown trap)",
        "x87 FPU Floating-Point Error",
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const))
    {
        return excnames[trapno];
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16)
    {
        return "Hardware Interrupt";
    }
    return "(unknown trap)";
}

/* trap_in_kernel - test if trap happened in kernel */
bool trap_in_kernel(struct trapframe *tf)
{
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
}

static const char *IA32flags[] = {
    "CF", NULL, "PF", NULL, "AF", NULL, "ZF", "SF",
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void print_trapframe(struct trapframe *tf)
{
    cprintf("trapframe at %p\n", tf);
    print_regs(&tf->tf_regs);
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
    cprintf("  es   0x----%04x\n", tf->tf_es);
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
    cprintf("  err  0x%08x\n", tf->tf_err);
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1)
    {
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL)
        {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);

    if (!trap_in_kernel(tf))
    {
        cprintf("  esp  0x%08x\n", tf->tf_esp);
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
    }
}

void print_regs(struct pushregs *regs)
{
    cprintf("  edi  0x%08x\n", regs->reg_edi);
    cprintf("  esi  0x%08x\n", regs->reg_esi);
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
    cprintf("  edx  0x%08x\n", regs->reg_edx);
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
    cprintf("  eax  0x%08x\n", regs->reg_eax);
}

static inline void print_pgfault(struct trapframe *tf)
{
    /* error_code:
     * bit 0 == 0 means no page found, 1 means protection fault
     * bit 1 == 0 means read, 1 means write
     * bit 2 == 0 means kernel, 1 means user
     * */
    cprintf("page fault at 0x%08x: %c/%c [%s].\n", rcr2(),
            (tf->tf_err & 4) ? 'U' : 'K',
            (tf->tf_err & 2) ? 'W' : 'R',
            (tf->tf_err & 1) ? "protection fault" : "no page found");
}

static int pgfault_handler(struct trapframe *tf)
{
    extern struct mm_struct *check_mm_struct;
    if (check_mm_struct != NULL)
    {
        //used for test check_swap
        print_pgfault(tf);
    }
    
    struct mm_struct *mm;
    if (check_mm_struct != NULL)
    {
        assert(current == idleproc);
        mm = check_mm_struct;
    }
    else
    {
        if (current == NULL)
        {
            print_trapframe(tf);
            print_pgfault(tf);
            panic("unhandled page fault.\n");
        }
        mm = current->mm;
    }
    
    return do_pgfault(mm, tf->tf_err, rcr2());
}

static volatile int in_swap_tick_event = 0;
extern struct mm_struct *check_mm_struct;

/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

static void trap_dispatch(struct trapframe *tf)
{
    char c;
    int ret = 0;

    switch (tf->tf_trapno)
    {
        case T_PGFLT:  //page fault
            if ((ret = pgfault_handler(tf)) != 0)
            {
                print_trapframe(tf);
                if (current == NULL)
                {
                    panic("handle pgfault failed. ret=%d\n", ret);
                }
                else
                {
                    if (trap_in_kernel(tf))
                    {
                        panic("handle pgfault failed in kernel mode. ret=%d\n", ret);
                    }
                    cprintf("killed by kernel.\n");
                    panic("handle user mode pgfault failed. ret=%d\n", ret);
                    do_exit(-E_KILLED);
                }
            }
            break;
            
        case T_SYSCALL:
            syscall();
            break;
            
        case IRQ_OFFSET + IRQ_TIMER:
            ticks++;
            assert(current != NULL);
            run_timer_list();
            if (ticks % TICK_NUM == 0)
            {
                print_ticks();
            }
            break;
            
        case IRQ_OFFSET + IRQ_COM1:
            c = cons_getc();
            cprintf("serial [%03d] %c\n", c, c);
            break;
            
        case IRQ_OFFSET + IRQ_KBD:
            c = cons_getc();
            cprintf("kbd [%03d] %c\n", c, c);
            {
                extern void dev_stdin_write(char c);
                dev_stdin_write(c);
            }
            break;
            
        case T_SWITCH_TOU:
            if (tf->tf_cs != USER_CS)
            {
                // 当前在内核态，需要建立切换到用户态所需要的 trapframe，通过中断返回切换到用户态
                // 这里只是模拟进入用户态，真正内核初始化完是需要运行一个用户进程来进入用户态
                // 但实际上最后本质都是通过中断，构造中断桢来修改 cpu 寄存器来实现状态切换
                switchk2u = *tf;
                switchk2u.tf_cs = USER_CS;
                switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
                
                // 如果是通过执行用户进程切换到用户态，这里 tf_esp 应该指向用户进程空间的堆栈地址，堆栈切换
                // 这里只是模拟，把内核代码切换到用户态，所以直接找到 int x 中断执行之前的 esp 地址，
                // 中断执行完之后还是直接用之前的内核堆栈，不切换堆栈
                switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
                
                // set eflags, make sure ucore can use io under user mode.
                // if CPL > IOPL, then cpu will generate a general protection.
                // 设置 EFLAG 的 I/O 特权位，使得在用户态可使用 in/out 指令
                switchk2u.tf_eflags |= FL_IOPL_MASK;
                
                // set temporary stack
                // then iret will jump to the right stack
                // 设置临时栈，指向 switchk2u，这样当 trap() 返回时，cpu 会从 switchk2u 恢复数据，
                // 而不是从现有 tf 栈恢复数据，相当于用 switchk2u 替换了 tf 的内容。
                // tf - 1 = pushl %esp
                *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
            }
            break;
            
        case T_SWITCH_TOK:
            if (tf->tf_cs != KERNEL_CS)
            {
                // 发出中断时，cpu 处于用户态，我们希望处理完中断后，cpu 能运行在内核态
                // 所以把 cs 和 ds 都设置为内核代码段和内核数据段
                tf->tf_cs = KERNEL_CS;
                tf->tf_ds = tf->tf_es = KERNEL_DS;
                tf->tf_eflags &= ~FL_IOPL_MASK;
                
                // 从用户态切换到内核态时，发生特权变更，cpu 已经根据 tss 内容把堆栈从用户空间堆栈
                // 切换到了内核堆栈，tf 结构现在在内核栈空间，但 tf_esp 还是指向 int x 执行之前的
                // 用户堆栈栈顶 ，现在需要在用户栈空间也构造 trapframe，所以把 tf 的内容先修改下
                // 然后复制到用户栈空间里，再返回让 cpu 从用户栈空间恢复数据来实现切换状态
                switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
                memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
                *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
            }
            break;
            
        case IRQ_OFFSET + IRQ_IDE1:
        case IRQ_OFFSET + IRQ_IDE2:
            /* do nothing */
            break;
            
        default:
            print_trapframe(tf);
            if (current != NULL)
            {
                cprintf("unhandled trap.\n");
                do_exit(-E_KILLED);
            }
            // in kernel, it must be a mistake
            panic("unexpected trap in kernel.\n");
    }
}

/* *
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
// 参数 tf 在汇编函数 __alltraps 里设置好，再调用 c 函数 trap
void trap(struct trapframe *tf)
{
    // dispatch based on what type of trap occurred
    // used for previous projects
    if (current == NULL)
    {
        trap_dispatch(tf);
    }
    else
    {
        // keep a trapframe chain in stack
        struct trapframe *otf = current->tf;
        current->tf = tf;
    
        bool in_kernel = trap_in_kernel(tf);
    
        trap_dispatch(tf);
    
        current->tf = otf;
        if (!in_kernel)
        {
            if (current->flags & PF_EXITING)
            {
                do_exit(-E_KILLED);
            }
            if (current->need_resched)
            {
                schedule();
            }
        }
    }
}

