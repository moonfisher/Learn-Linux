/*
* =====================================================================================
*
*       Filename:  gdt.c
*
*    Description:  全局描述符表相关
*
*        Version:  1.0
*        Created:  2014年11月04日 14时13分14秒
*       Revision:  none
*       Compiler:  gcc
*
*         Author:  Qianyi.lh (liuhuan), qianyi.lh@alibaba-inc.com
*        Company:  Alibaba-Inc Aliyun
*
* =====================================================================================
*/

#include "gdt.h"

// 全局描述符类型
typedef struct gdt_entry_t {
    uint16_t limit_low;     // 段界限   15～0
    uint16_t base_low;      // 段基地址 15～0
    uint8_t  base_middle;   // 段基地址 23～16
    uint8_t  access;        // 段存在位、描述符特权级、描述符类型、描述符子类别
    uint8_t  granularity;   // 其他标志、段界限 19～16
    uint8_t  base_high;     // 段基地址 31～24
} __attribute__((packed)) gdt_entry_t;

// 全局描述符表定义 0xc010b540
static gdt_entry_t gdt_entries[GDT_LENGTH] __attribute__ ((aligned(8)));

static void gdt_set_gate(int32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t gran)
{
    gdt_entries[num].base_low     = (base & 0xFFFF);
    gdt_entries[num].base_middle  = (base >> 16) & 0xFF;
    gdt_entries[num].base_high    = (base >> 24) & 0xFF;

    gdt_entries[num].limit_low    = (limit & 0xFFFF);
    gdt_entries[num].granularity  = (limit >> 16) & 0x0F;

    gdt_entries[num].granularity |= gran & 0xF0;
    gdt_entries[num].access       = access;
}

// TSS 段定义 0xc010b570
static tss_entry_t tss_entry __attribute__ ((aligned(8)));

/*
 {ts_link = 0x0, ts_esp0 = 0x0, ts_ss0 = 0x10, ts_padding1 = 0x0, ts_esp1 = 0x0, ts_ss1 = 0x0,
 ts_padding2 = 0x0, ts_esp2 = 0x0, ts_ss2 = 0x0, ts_padding3 = 0x0, ts_cr3 = 0x0, ts_eip = 0x0,
 ts_eflags = 0x0, ts_eax = 0x0, ts_ecx = 0x0, ts_edx = 0x0, ts_ebx = 0x0, ts_esp = 0x0, ts_ebp = 0x0,
 ts_esi = 0x0, ts_edi = 0x0, ts_es = 0x23, ts_padding4 = 0x0, ts_cs = 0x1b, ts_padding5 = 0x0,
 ts_ss = 0x23, ts_padding6 = 0x0, ts_ds = 0x23, ts_padding7 = 0x0, ts_fs = 0x23, ts_padding8 = 0x0,
 ts_gs = 0x23, ts_padding9 = 0x0, ts_ldt = 0x0, ts_padding10 = 0x0, ts_t = 0x0, ts_iomb = 0x0}
*/
static void tss_set_gate(int32_t num, uint16_t ss0, uint32_t esp0)
{
    // 获取 TSS 描述符的位置和长度
    uint32_t base = (uint32_t)&tss_entry;
    uint32_t limit = base + sizeof(tss_entry);

    // 在 GDT 表中增加 TSS 段描述
    gdt_set_gate(num, base, limit, 0x89, 0x40);

    // 设置内核栈的地址
    tss_entry.ts_ss0  = ss0;
    tss_entry.ts_esp0 = esp0;

    tss_entry.ts_cs = USER_CS;
    tss_entry.ts_ss = USER_DS;
    tss_entry.ts_ds = USER_DS;
    tss_entry.ts_es = USER_DS;
    tss_entry.ts_fs = USER_DS;
    tss_entry.ts_gs = USER_DS;
}

// GDTR
typedef struct gdt_ptr_t {
    uint16_t limit;         // 全局描述符表限长
    uint32_t base;          // 全局描述符表 32位 基地址
} __attribute__((packed)) gdt_ptr_t;

// GDTR  {limit = 0x2f, base = 0xc010b540}
static gdt_ptr_t gdt_ptr;

// 初始化全局描述符表
/*
 {
    {limit_low = 0x0, base_low = 0x0, base_middle = 0x0, access = 0x0, granularity = 0x0, base_high = 0x0},
    {limit_low = 0xffff, base_low = 0x0, base_middle = 0x0, access = 0x9b, granularity = 0xcf, base_high = 0x0},
    {limit_low = 0xffff, base_low = 0x0, base_middle = 0x0, access = 0x93, granularity = 0xcf, base_high = 0x0},
    {limit_low = 0xffff, base_low = 0x0, base_middle = 0x0, access = 0xfa, granularity = 0xcf, base_high = 0x0},
    {limit_low = 0xffff, base_low = 0x0, base_middle = 0x0, access = 0xf2, granularity = 0xcf, base_high = 0x0},
    {limit_low = 0xb5d8, base_low = 0xb570, base_middle = 0x10, access = 0x8b, granularity = 0x40, base_high = 0xc0}
 }
*/
void gdt_init(void)
{
    printk("gdt_init() gdt_entries: 0x%X\n", &gdt_entries);
    
    // 全局描述符表界限  从 0 开始，所以总长要 - 1
    gdt_ptr.limit = sizeof(gdt_entry_t) * GDT_LENGTH - 1;
    gdt_ptr.base = (uint32_t)&gdt_entries;
    
    // 采用 Intel 平坦模型
    gdt_set_gate(SEG_NULL,  0x0, 0x0, 0x0, 0x0);            // Intel文档要求首个描述符全0
    gdt_set_gate(SEG_KTEXT, 0x0, 0xFFFFFFFF, 0x9A, 0xC0);   // 内核指令段
    gdt_set_gate(SEG_KDATA, 0x0, 0xFFFFFFFF, 0x92, 0xC0);   // 内核数据段
    gdt_set_gate(SEG_UTEXT, 0x0, 0xFFFFFFFF, 0xFA, 0xC0);   // 用户模式代码段
    gdt_set_gate(SEG_UDATA, 0x0, 0xFFFFFFFF, 0xF2, 0xC0);   // 用户模式数据段
    
    tss_set_gate(SEG_TSS, KERNEL_DS, 0);
    
    // 加载全局描述符表地址到 GPTR 寄存器
    gdt_flush((uint32_t)&gdt_ptr);
    
    // 加载任务寄存器
    tss_flush();
}

