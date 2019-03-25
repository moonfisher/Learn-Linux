/*
* =====================================================================================
*
*       Filename:  arch_init.c
*
*    Description:  体系结构相关初始化
*
*        Version:  1.0
*        Created:  2015年02月03日 16时26分53秒
*       Revision:  none
*       Compiler:  gcc
*
*         Author:  Qianyi.lh (liuhuan), qianyi.lh@alibaba-inc.com
*        Company:  Alibaba-Inc Aliyun
*
* =====================================================================================
*/

#include <arch.h>

// 体系结构相关的初始化函数
void arch_init(void)
{
    // 进入内核之前 grub 实际已经设置好了 gdt，此处可以根据实际需要重新设置
    gdt_init();
    
    // BIOS已经提供了一些中断程序和中断向量表，但可以根据实际需要重新设置，完全覆盖BIOS提供的中断
    idt_init();
    
    // 时钟中断是打断程序运行，根据时间片来调度进程的关键
    clock_init();
    console_init();
}

