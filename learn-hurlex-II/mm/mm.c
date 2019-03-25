/*
* =====================================================================================
*
*       Filename:  mm.c
*
*    Description:  内存管理子系统
*
*        Version:  1.0
*        Created:  2014年11月05日 09时54分05秒
*       Revision:  none
*       Compiler:  gcc
*
*         Author:  Qianyi.lh (liuhuan), qianyi.lh@alibaba-inc.com
*        Company:  Alibaba-Inc Aliyun
*
* =====================================================================================
*/

#include <mm/mm.h>

void mm_init(void)
{
    //从虚拟地址 0xC0537000 开始，初始化 0x1A92 个物理页面，每页 4k，以链表的形式连接内存页面
    pmm_init();
    
    // 构造页表映射，内核地址 0xC0000000～0xF8000000 映射到 物理地址 0x00000000～0x38000000 (物理内存前896MB)
    // 0xF8000000 - 0xC0000000 = 0x38000000
    vmm_init();
    
    //slob 内存分配器
    slob_init();
}

