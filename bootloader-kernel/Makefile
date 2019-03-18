CC = gcc#i386-elf-gcc
LD = ld#i386-elf-ld
GDB = gdb#i386-elf-gdb
OBJCOPY = objcopy#i386-elf-objcopy
NASM = nasm
CFLAGS = -g -m32 -ffreestanding -c -Ikernel -I include

C_SOURCES = $(shell find . -name "*.c")
HEADERS = $(wildcard kernel/*.h)
OBJS = $(C_SOURCES:.c=.o) # 将.c替换为.o


all: OS.bin

OS.bin: boot/bootloader.bin kernel/main.bin
	cat $^ > $@

# 调试用
kernel/main.elf: boot/bootentry.o\
	$(OBJS)
	$(LD) -Tlink.ld -m elf_i386 -o $@ $^

kernel/main.bin: kernel/main.elf
	# 利用objcopy从带符号的elf文件中抽出纯二进制文件
	$(OBJCOPY) -O binary $< $@

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(NASM) $< -g -f elf -I boot/ -o $@

%.bin: %.asm
	$(NASM) $< -f bin -I boot/ -o $@

run: OS.bin
	#bochs
	qemu-system-i386 -fda OS.bin

debug: OS.bin kernel/kernel.elf kernel.gdb
	$(GDB) -tui -x kernel.gdb

clean:
	rm -rf OS.bin
	rm -rf kernel/*.bin kernel/*.elf
	rm -rf kernel/*.o boot/*.bin lib/*.o
