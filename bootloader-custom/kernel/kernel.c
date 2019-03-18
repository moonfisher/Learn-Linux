
#include "kprint.h"
#include "types.h"

int main()
{
	print_clear();
	print_str("main addr:");
	print_hex((uint32_t)(int *)&main);
	print_str("\r\n");
	print_str("Hello, OS!\r\n");

	return 0;
}
