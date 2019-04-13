#include "stdio.h"
#include "ulib.h"

int zero = 0;

int main(void)
{
    cprintf("value is %d.\n", 1 / zero);
    panic("FAIL: T.T\n");
}

