
#include "kprint.h"
#include "multiboot.h"

//通过 grub 引导的操作系统，grub 在引导完之后，会搜集一些硬件信息放在内存里，提供给操作系统使用，
//这些信息在 boot.asm 代码里，放到 glb_mboot_ptr 地址上
void show_memory_map()
{
	uint32_t mmap_addr = glb_mboot_ptr->mmap_addr;
	uint32_t mmap_length = glb_mboot_ptr->mmap_length;

	mmap_entry_t *mmap = (mmap_entry_t *) mmap_addr;
	for (mmap = (mmap_entry_t *) mmap_addr; (uint32_t) mmap < mmap_addr + mmap_length; mmap++)
	{
		print_hex((uint32_t) mmap->base_addr_low);
		print_char('\n');
	}
}

int kernel_main()
{
	print_clear();
	print_str("\r\n");
	print_hex((uint32_t)(int *)&kernel_main);
	print_str("\r\n");
        print_hex((uint32_t)glb_mboot_ptr);
	print_str("\r\n");
	print_str("memory map is below\r\n");
	show_memory_map();

	return 0;
}




