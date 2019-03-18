[BITS 32]
[EXTERN bootmain]	; 导入外部符号
call bootmain		; 进入内核程序
jmp $
