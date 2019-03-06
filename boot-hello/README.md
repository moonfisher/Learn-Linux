//testAdd 测试从 c 调用 asm<br>
//编译说明，centos下按照elf 32位（汇编用的32位写法，不能按照64位编译），编译出来都是 elf 可执行文件

<code>
nasm -f elf32 testAdd-s.asm -o testAdd-s.o
<br>
gcc -m32 testAdd-c.c testAdd-s.o -o testAdd.out
</code>
