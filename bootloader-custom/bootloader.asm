[BITS 16]
[ORG 0X7C00]


; 主函数
MAIN:
	MOV [BOOT_DRIVE], DL			; BIOS将启动磁盘号记录在DL
	MOV BP, 0X9000					; 设置栈底指针
	MOV SP, BP

	MOV DX, 0X8888
	CALL PRINT_HEX					; 打印 0X8888

	MOV BX, REAL_HELLO
	CALL PRINT_STRING				; 打印 HELLO

	CALL LOAD_KERNEL				; 从磁盘读取操作系统数据到内存

	;CALL SWITCH_TO_PM				; 切换到32位保护模式
	CALL KERNEL_OFFSET				; JMP 执行内核代码
	JMP $



; 打印16进制数，使用 DX 传参
PRINT_HEX:
	PUSHA
	MOV CX, 4						; 清零
	MOV AL, [HEX_DIGIT] 			; '0'
	.CLEAR:
		MOV BX, CX
		MOV [HEX_OUT + 1 + BX], AL
		LOOP .CLEAR

	MOV CX, 4
	.REPEAT:
		MOV BX, DX
		AND BX, 0X0F ; 取出最后一位
		MOV AL, [BX + HEX_DIGIT]
		MOV BX, CX
		MOV [HEX_OUT + 1 + BX], AL
		SHR DX, 0X4
		LOOP .REPEAT

	MOV BX, HEX_OUT
	CALL PRINT_STRING

	.DONE:
		POPA
		RET



; 打印字符串，使用 BX 传参，BX为字符串地址
PRINT_STRING:
	PUSHA
	MOV AH, 0XE
	.REPEAT:
		MOV AL, [BX]
		CMP AL, 0
		JE .DONE
		INT 0X10
		INC BX
		JMP .REPEAT
	.DONE:
		POPA
		RET



; 读取磁盘数据到[ES:BX]，DL 指定第几个磁盘，DH 指定读取几块扇区，BX 在外面已经设置好了
DISK_LOAD:
    PUSH DX
    MOV AH, 0X02    				; 设置BIOS读取扇区程序参数
    MOV AL, DH      				; 设置读取的扇区数量
    MOV CH, 0X00    				; 设置读取第0个柱面
    MOV CL, 0X02    				; 设置读取第2个扇区
    MOV DH, 0X00    				; 设置第0个磁头

    INT 0X13        				; BIOS读取扇区中断程序
    POP DX

    JC DISK_ERROR   				; 读取失败会设置CF位
	CMP AL, DH      				; AL记录了成功读取扇区块数
	JNE DISK_ERROR
    RET

DISK_ERROR:
    MOV BX, DISK_ERROR_MSG
    CALL PRINT_STRING
    JMP $



; 加载内核 KERNEL.BIN 到 KERNEL_OFFSET 地址上
LOAD_KERNEL:
	MOV BX, MSG_LOAD_KERNEL
	CALL PRINT_STRING

	MOV BX, KERNEL_OFFSET
	MOV DH, 0X30					; 需要注意读取的扇区数！过小导致加载不完全。
	MOV DL, [BOOT_DRIVE]
	CALL DISK_LOAD					; ES：BX	缓冲区地址，即数据读到这里
	RET



; 常量
KERNEL_OFFSET EQU 0X1000			; 内核加载到0X1000的内存地址



; 全局变量
REAL_HELLO: 		DB 		"HELLO WORLD! FROM OS, STARTED IN 16 BIT REAL MODE", 0XA, 0XD, 0
PROT_HELLO: 		DB 		"HELLO WORLD! FROM OS, SUCCESSFULLY LANDED IN 32 BIT PROTECTED MODE", 0
BOOT_DRIVE:			DB 		0
HEX_OUT: 			DB 		'0X0000', 0X0A, 0XD, 0 ; 模板串，CRLF
HEX_DIGIT: 			DB 		'0123456789ABCDEF'
DISK_ERROR_MSG: 	DB 		"DISK READ ERROR!", 0XA, 0XD, 0
MSG_LOAD_KERNEL: 	DB 		'LOADING OS KERNEL INTO MEMORY', 0XA, 0XD, 0



; 填充并设置为启动扇区
TIMES 510 - ($-$$) DB 0
DW 0XAA55

