#include <stdio.h>

extern int add(int a, int b);

int main(int argc, char **argv)
{
	int sum = add(2, 6);
	printf("%d\n", sum);
  	return 0;
}

