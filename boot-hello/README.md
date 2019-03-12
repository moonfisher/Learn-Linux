1）boot-hello 是一个引导程序，nasm语法纯汇编编写，引导程序最终编译成 bin 二进制格式，并非 elf 格式<br>
2）引导程序代码初始需要增加 org 0x7c00 伪指令，是因为cpu上电后，在执行完 bios 指令之后，会把在 bios 里设置的第一启动盘，第一个分区的 512 字节数据作为引导程序，加载到内存 0x7c00 处执行。但引导程序在使用 nasm 编译的时候，编译器默认计算的虚拟地址基地址是 0x0000，这样代码中和取地址相关的汇编指令，地址偏移都是依据 0x0000 来计算的，等到代码实际被加载到内存中之后，这个地址已经不对了，读取数据会发生错误<br>
3）代码里用的是 [bits 16] 而不是 [bits 32]，因为 cpu 刚启动的时候是运行在 16 位实模式之下的，这两种方式编译的最终的机器指令不同<br>

<code>
nasm -f bin boot-hello.asm -o boot-hello.bin
</code>
<br>
<code>
dd if=boot-hello.bin of=a.img bs=512 count=1 conv=notrunc	
</code>
<br>
<code>
bochs -f bochsrc.txt	
</code>
<br>

