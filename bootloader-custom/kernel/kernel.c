
#include "kprint.h"

int main()
{
	print_clear();
	print_str("\r\n");
	print_hex((uint32_t)(int *)&main);
	print_str("\r\n");
	print_str("Hello, OS!\r\n");

	return 0;
}
