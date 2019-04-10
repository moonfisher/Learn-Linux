#include "mmu.h"
#include "memlayout.h"

#define REALLOC(x) (x - KERNBASE)

.text
.globl kern_entry
kern_entry: # 0x00100000
    # load pa of boot pgdir
    # 加载临时分页方案, __boot_pgdir 但此时还没开启分页，需要减去 KERNBASE
    movl $REALLOC(__boot_pgdir), %eax # mov eax, 0x00156000
    movl %eax, %cr3

    # enable paging
    movl %cr0, %eax
    # or eax, 0x8005002f
    orl $(CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_TS | CR0_EM | CR0_MP), %eax
    # and eax, 0xfffffff3
    andl $~(CR0_TS | CR0_EM), %eax
    movl %eax, %cr0

    # update eip
    # now, eip = 0x1.....
    # 分页开启之后，通过跳转指令重新设置 EIP 寄存器
    leal next, %eax # lea eax, dword ptr 0x0010:0xC010001E
    # set eip = KERNBASE + 0x1.....
    jmp *%eax
next:

    # unmap va 0 ~ 4M, it's temporary mapping
    # 跳转完毕后，内核代码已经都运行在虚拟地址上，通过把 boot_pgdir[0] 对应的第一个页目录表项
    # 清零来取消了（0 ~ 4MB）临时的页映射关系
    # 只保留 0xC0000000 ~ 0xC0400000 映射到物理地址 0 ~ 4M 这个关系
    xorl %eax, %eax
    movl %eax, __boot_pgdir # mov dword ptr 0x0010:0xC0156000, eax

    # set ebp, esp
    movl $0x0, %ebp             # mov ebp, 0x00000000
    # the kernel stack region is from bootstack -- bootstacktop,
    # the kernel stack size is KSTACKSIZE (8KB)defined in memlayout.h
    # 重新设置内核栈空间，当前栈空间还是 bootloader 设置的，现在分页开启之后，可以重新规划栈空间，这里规划了8k
    movl $bootstacktop, %esp    # mov esp, 0xC0154000
    # now kernel stack is ready , call the first C function
    call kern_init              # call .+2 (0xC0100036)

# should never get here
spin:
    jmp spin

.data
.align PGSIZE
    .globl bootstack
bootstack: # 0xC0152000 内核栈，供内核代码，以及用户进程陷入内核态之后使用
    .space KSTACKSIZE # (KSTACKPAGE * PGSIZE) = 8k = 0x2000
    .globl bootstacktop
bootstacktop: # 0xC0154000

# kernel builtin pgdir
# an initial page directory (Page Directory Table, PDT)
# These page directory table and page table can be reused!
# 内核基于 32 bit 编译，地址都是虚拟地址，运行内核前必须先设置好临时的内存分页，内核运行起来后重新再设置分页
.section .data.pgdir
.align PGSIZE
__boot_pgdir:
.globl __boot_pgdir # 0xC0156000 页目录地址
    # map va 0 ~ 4M to pa 0 ~ 4M (temporary) 目录地址 0x00156000
    # 虚拟地址 0 ~ 4M 映射到物理地址 0 ~ 4M，这里先临时映射 4M 就够用了，内核没那么大
    # KERNBASE >> PGSHIFT >> 10 << 2 这里取内核虚拟地址高10位，然后左移2位是因为页目录一条记录占4个字节
    .long REALLOC(__boot_pt1) + (PTE_P | PTE_U | PTE_W)
    .space (KERNBASE >> PGSHIFT >> 10 << 2) - (. - __boot_pgdir) # pad to PDE of KERNBASE

    # map va KERNBASE + (0 ~ 4M) to pa 0 ~ 4M 目录地址 0x00156C00 = 0x00156000 + 0x300 * 4
    # 虚拟地址 0xC0000000 ~ 0xC0400000 映射到物理地址 0 ~ 4M，这里先临时映射 4M 就够用了，内核没那么大
    # 内核代码在物理内存的低端地址上，但映射到了虚拟地址空间的高端内存上
    # 实际上这种映射限制了内核的大小。当内核大小超过预期的4MB （实际上是3M，因为内核从 0x100000开始编址）
    # 就可能导致打开分页之后内核crash，在某些试验中，也的确出现了这种情况。
    # 解决方法同样简单，就是正确填充更多的页目录项即可。
    .long REALLOC(__boot_pt1) + (PTE_P | PTE_U | PTE_W)
    .space PGSIZE - (. - __boot_pgdir) # pad to PGSIZE

.set i, 0
__boot_pt1:
.globl __boot_pt1 # 0xC0157000
.rept 1024
    .long i * PGSIZE + (PTE_P | PTE_W)
    .set i, i + 1
.endr

# <bochs:7> x /64hx 0x00156000
# 0x00156000 :0x7007    0x0015    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156010 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156020 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156030 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000

# <bochs:7> x /64hx 0x00156C00
# 0x00156c00 :0x7007    0x0015    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156c10 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156c20 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000
# 0x00156c30 :0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000    0x0000

# (gdb) x /64hx 0xC0157000
# 0xC0157000: 0x0003  0x0000  0x1003  0x0000  0x2003  0x0000  0x3003  0x0000
# 0xC0157010: 0x4003  0x0000  0x5003  0x0000  0x6003  0x0000  0x7003  0x0000
# 0xC0157020: 0x8003  0x0000  0x9003  0x0000  0xa003  0x0000  0xb003  0x0000
# 0xC0157030: 0xC003  0x0000  0xd003  0x0000  0xe003  0x0000  0xf003  0x0000

# 0xC0157040: 0x0003  0x0001  0x1003  0x0001  0x2003  0x0001  0x3003  0x0001
# 0xC0157050: 0x4003  0x0001  0x5003  0x0001  0x6003  0x0001  0x7003  0x0001
# 0xC0157060: 0x8003  0x0001  0x9003  0x0001  0xa003  0x0001  0xb003  0x0001
# 0xC0157070: 0xC003  0x0001  0xd003  0x0001  0xe003  0x0001  0xf003  0x0001
