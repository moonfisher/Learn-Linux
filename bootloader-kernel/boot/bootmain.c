
#include "kprint.h"
#include "types.h"

int bootmain()
{
	print_clear();
	print_str("bootmain addr:");
	print_hex((uint32_t)(int *)&bootmain);
	print_str("\r\n");

	return 0;
}
