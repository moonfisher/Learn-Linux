CC = gcc
ASM = nasm
LD = ld
MOUNT_POINT = /mnt/grub-os

C_SOURCES = $(shell find . -name "*.c")
C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))
CC_FLAGS = -c -Wall -m32 -ggdb -gstabs+ -nostdinc -fno-builtin -fno-stack-protector -I include
LD_FLAGS = -T link.ld -m elf_i386 -nostdlib

all: boot.o $(C_OBJECTS) link update_kernel

.c.o:
	@echo '编译源代码...'
	$(CC) $(CC_FLAGS) $< -o $@

boot.o: boot.asm
	@echo '编译boot...'
	$(ASM) -f elf boot.asm

.PHONY: kernel
link:
	@echo '生成最终kernel..'
	$(LD) $(LD_FLAGS) boot.o  $(C_OBJECTS) -o kernel

.PHONY: update_kernel
update_kernel:
	@echo '将kernel拷贝到软盘镜像..'
	@if [ ! -d $(MOUNT_POINT) ]; then mkdir $(MOUNT_POINT); fi  # 挂载点不存在则创建
	sudo mount grub-os.img /mnt/grub-os
	sudo cp kernel /mnt/grub-os/kernel
	sleep 1
	sudo umount /mnt/grub-os

.PHONY:qemu
qemu:
	@echo '启动虚拟机...'
	qemu -fda grub-os.img -boot a

.PHONY: clean
clean:
	rm *.o kernel
	rm lib/*.o
