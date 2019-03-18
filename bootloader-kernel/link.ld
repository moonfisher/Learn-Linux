start = 0x9000;
ENTRY(start)
SECTIONS {
	. = start; /*起始地址*/
	.text : {
		*(.text)
	}
	.data : {
		*(.data)
		*(.rodata)
	}
	.bss : {
		*(.bss);
	}
	end = .; /* 程序结束区域 */
}

