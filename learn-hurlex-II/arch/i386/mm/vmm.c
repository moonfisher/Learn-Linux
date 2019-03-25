/*
* =====================================================================================
*
*       Filename:  vmm.c
*
*    Description:  虚拟内存管理
*
*        Version:  1.0
*        Created:  2014年11月05日 09时55分49秒
*       Revision:  none
*       Compiler:  gcc
*
*         Author:  Qianyi.lh (liuhuan), qianyi.lh@alibaba-inc.com
*        Company:  Alibaba-Inc Aliyun
*
* =====================================================================================
*/

#include <arch.h>
#include <common.h>
#include <debug.h>
#include <mm/mm.h>
#include <lib/string.h>

// 内核页目录 0xC0118000
pgd_t pgd_kern[PGD_SIZE] __attribute__ ((aligned(PAGE_SIZE)));
/*
 {0x0 <repeats 768 times>, 0x437003, 0x438003, 0x439003, 0x43a003, 0x43b003, 0x43c003, 0x43d003,
 0x43e003, 0x43f003, 0x440003, 0x441003, 0x442003, 0x443003, 0x444003, 0x445003, 0x446003, 0x447003,
 0x448003, 0x449003, 0x44a003, 0x44b003, 0x44c003, 0x44d003, 0x44e003, 0x44f003, 0x450003, 0x451003,
 0x452003, 0x453003, 0x454003, 0x455003, 0x456003, 0x457003, 0x458003, 0x459003, 0x45a003, 0x45b003,
 0x45c003, 0x45d003, 0x45e003, 0x45f003, 0x460003, 0x461003, 0x462003, 0x463003, 0x464003, 0x465003,
 0x466003, 0x467003, 0x468003, 0x469003, 0x46a003, 0x46b003, 0x46c003, 0x46d003, 0x46e003, 0x46f003,
 0x470003, 0x471003, 0x472003, 0x473003, 0x474003, 0x475003, 0x476003, 0x477003, 0x478003, 0x479003,
 0x47a003, 0x47b003, 0x47c003, 0x47d003, 0x47e003, 0x47f003, 0x480003, 0x481003, 0x482003, 0x483003,
 0x484003, 0x485003, 0x486003, 0x487003, 0x488003, 0x489003, 0x48a003, 0x48b003, 0x48c003, 0x48d003,
 0x48e003, 0x48f003, 0x490003, 0x491003, 0x492003, 0x493003, 0x494003, 0x495003, 0x496003, 0x497003,
 0x498003, 0x499003, 0x49a003, 0x49b003, 0x49c003, 0x49d003, 0x49e003, 0x49f003, 0x4a0003, 0x4a1003,
 0x4a2003, 0x4a3003, 0x4a4003, 0x4a5003, 0x4a6003, 0x4a7003, 0x4a8003, 0x4a9003, 0x4aa003, 0x4ab003,
 0x4ac003, 0x4ad003, 0x4ae003, 0x4af003, 0x4b0003, 0x4b1003, 0x4b2003, 0x4b3003, 0x4b4003, 0x4b5003,
 0x4b6003, 0x4b7003, 0x4b8003, 0x4b9003, 0x4ba003, 0x4bb003, 0x4bc003, 0x4bd003, 0x4be003, 0x4bf003,
 0x4c0003, 0x4c1003, 0x4c2003, 0x4c3003, 0x4c4003, 0x4c5003, 0x4c6003, 0x4c7003, 0x4c8003, 0x4c9003,
 0x4ca003, 0x4cb003, 0x4cc003, 0x4cd003, 0x4ce003, 0x4cf003, 0x4d0003, 0x4d1003, 0x4d2003, 0x4d3003,
 0x4d4003, 0x4d5003, 0x4d6003, 0x4d7003, 0x4d8003, 0x4d9003, 0x4da003, 0x4db003, 0x4dc003, 0x4dd003,
 0x4de003, 0x4df003, 0x4e0003, 0x4e1003, 0x4e2003, 0x4e3003, 0x4e4003, 0x4e5003, 0x4e6003, 0x4e7003,
 0x4e8003, 0x4e9003, 0x4ea003, 0x4eb003, 0x4ec003, 0x4ed003, 0x4ee003, 0x4ef003, 0x4f0003, 0x4f1003,
 0x4f2003, 0x4f3003, 0x4f4003...}
*/

// 内核页表起始 0xC0137000
#if ASM_NO_XCODE
    static pte_t *pte_addr = (pte_t *)((uint32_t)kern_end + KERNBASE);
#else
    static pte_t *pte_addr;
#endif

void vmm_init(void)
{
    // 注册页错误中断的处理函数
    register_interrupt_handler(INT_PAGE_FAULT, &do_page_fault);
    
    // 页表数组指针 PTE_SIZE = 1024
    pte_t (*pte_kern)[PTE_SIZE] = (pte_t (*)[PTE_SIZE])pte_addr;

    // 构造页目录(MMU需要的是物理地址，此处需要减去偏移)
    uint32_t pgd_idx = PGD_INDEX(PAGE_OFFSET); // 0x300
    for (uint32_t i = pgd_idx; i < pgd_idx + PTE_COUNT; ++i)
    {
        pgd_kern[i] = ((uint32_t)ka_to_pa(pte_kern[i])) | PAGE_PRESENT | PAGE_WRITE;
    }

    // 构造页表映射，内核 0xC0000000～0xF8000000 映射到 物理 0x00000000～0x38000000 (物理内存前896MB)
    // 0xF8000000 - 0xC0000000 = 0x38000000
    uint32_t *pte_start = (uint32_t *)(pte_addr + PTE_SIZE * pgd_idx);
    for (uint32_t i = 0; i < PTE_SIZE * PTE_COUNT; ++i)
    {
        pte_start[i] = (i << 12) | PAGE_PRESENT | PAGE_WRITE;
    }

    switch_pgd((uint32_t)ka_to_pa(pgd_kern));
}

void map(pgd_t *pgd_now, uint32_t va, uint32_t pa, uint32_t flags)
{       
    uint32_t pgd_idx = PGD_INDEX(va);
    uint32_t pte_idx = PTE_INDEX(va);
    
    pte_t *pte = (pte_t *)(pgd_now[pgd_idx] & PAGE_MASK);
    if (!pte)
    {
        pte = (pte_t *)alloc_pages(1);
        pgd_now[pgd_idx] = (uint32_t)pte | PAGE_PRESENT | PAGE_WRITE;
        pte = (pte_t *)pa_to_ka(pte);
    }
    else
    {
        pte = (pte_t *)pa_to_ka(pte);
    }

    pte[pte_idx] = (pa & PAGE_MASK) | flags;

    tlb_reload_page(va);
}

void unmap(pgd_t *pgd_now, uint32_t va)
{
    uint32_t pgd_idx = PGD_INDEX(va);
    uint32_t pte_idx = PTE_INDEX(va);

    pte_t *pte = (pte_t *)(pgd_now[pgd_idx] & PAGE_MASK);
    if (!pte)
    {
        return;
    }

    // 转换到内核线性地址
    pte = (pte_t *)(pa_to_ka(pte));

    pte[pte_idx] = 0;
    
    tlb_reload_page(va);
}

uint32_t get_mapping(pgd_t *pgd_now, uint32_t va, uint32_t *pa)
{
    uint32_t pgd_idx = PGD_INDEX(va);
    uint32_t pte_idx = PTE_INDEX(va);

    pte_t *pte = (pte_t *)(pgd_now[pgd_idx] & PAGE_MASK);
    if (!pte)
    {
        return 0;
    }
    
    // 转换到内核线性地址
    pte = (pte_t *)(pa_to_ka(pte));

    // 如果地址有效而且指针不为NULL，则返回地址
    if (pte[pte_idx] != 0 && pa)
    {
        *pa = pte[pte_idx] & PAGE_MASK;
        return 1;
    }

    return 0;
}

