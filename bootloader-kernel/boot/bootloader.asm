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

	CALL SWITCH_TO_PM				; 切换到32位保护模式之后再跳转到内核入口
	;CALL KERNEL_OFFSET				; 不能在实模式下跳转内核入口，因为内核是基于32位编译，目前是16位下，无法执行32位机器码
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



; 切换到32位保护模式
SWITCH_TO_PM:
    CLI                     		; 关中断，直到设置保护模式的中断向量表
    LGDT [GDT_DESCRIPTOR]   		; 告诉CPU GDT表的位置
    MOV EAX, CR0            		; 设置CR0寄存器的第0位
    OR EAX, 0X01
    MOV CR0, EAX                    ; CR0寄存器设置完后，下个指令就已经是保护模式执行了

    JMP CODE_SEG:INIT_PM    		; FAR JUMP，会自动将CS更新为目标段。



[BITS 32]
; 保护模式初始化，重置段寄存器
INIT_PM:
    MOV AX, DATA_SEG
    MOV DS, AX
    MOV SS, AX
    MOV ES, AX
    MOV FS, AX
    MOV GS, AX

    MOV EBP, 0X90000				; 栈指针
    MOV ESP, EBP

	MOV EBX, PROT_HELLO
	CALL PRINT_STRING_PM

	CALL KERNEL_OFFSET				; JMP, 执行内核代码
	JMP $



; 32位保护模式下的PRINT_STRING函数，EBX存放字符串地址
PRINT_STRING_PM:
    PUSHA
    MOV EDX, VRAM_ADDR
    .LOOP:
        MOV AL, [EBX]
        MOV AH, WHITE_ON_BLACK

        CMP AL, 0
        JE .DONE
        MOV [EDX], AX               ; 写数据到显存中
        INC EBX                     ; 移动到下一个字符
        ADD EDX, 2                  ; 移动到下一格
        JMP .LOOP

    .DONE:
        POPA
        RET



; 常量
KERNEL_OFFSET 		EQU 	0X9000					; 内核加载到0X9000的内存地址，这个地址内存是空闲的没有其他程序会用到
VRAM_ADDR       	EQU     0XB8000     			; 显存地址
WHITE_ON_BLACK  	EQU     0X0F        			; 黑底白字
CODE_SEG 			EQU 	GDT_CODE - GDT_START   	; 段寄存器的索引，GDT[DS]
DATA_SEG 			EQU 	GDT_DATA - GDT_START



; 全局变量
REAL_HELLO: 		DB 		"HELLO WORLD! FROM OS, STARTED IN 16 BIT REAL MODE", 0XA, 0XD, 0
PROT_HELLO: 		DB 		"HELLO WORLD! FROM OS, SUCCESSFULLY LANDED IN 32 BIT PROTECTED MODE", 0
BOOT_DRIVE:			DB 		0
HEX_OUT: 			DB 		'0X0000', 0X0A, 0XD, 0 ; 模板串，CRLF
HEX_DIGIT: 			DB 		'0123456789ABCDEF'
DISK_ERROR_MSG: 	DB 		"DISK READ ERROR!", 0XA, 0XD, 0
MSG_LOAD_KERNEL: 	DB 		'LOADING OS KERNEL INTO MEMORY', 0XA, 0XD, 0



; 定义一个GDT表，含3个实体（每个8字节），分别为NULL段，代码段，数据段。
GDT_START:

GDT_NULL:							; 8字节的NULL段
    DD 0X0
    DD 0X0

GDT_CODE:   						; 定义代码段
; BASE=0X0, LIMIT=0XFFFFF,
; 1ST FLAGS: (PRESENT)1 (PRIVILEGE)00 (DESCRIPTOR TYPE)1 -> 1001B
; TYPE FLAGS: (CODE)1 (CONFORMING)0 (READABLE)1 (ACCESSED)0 -> 1010B
; 2ND FLAGS: (GRANULARITY)1 (32-BIT DEFAULT)1 (64-BIT SEG)0 (AVL)0 -> 1100B
    DW 0XFFFF           			; SEGMENT LIMIT(0:15)
    DW 0X0              			; BASE ADDRESS(0:15)
    DB 0X0              			; BASE ADDRESS(16:23)
    DB 10011010B        			; 1ST FLAGS和TYPE FLAGS
    DB 11001111B        			; 2ND FLAGS和SEGMENT LIMIT(16:19)
    DB 0X0              			; BASE ADDRESS(24:31)

GDT_DATA:   ; 定义数据段
; 和代码段一样，除了TYPE字段：
; TYPE FLAGS: (CODE)0 (EXPAND DOWN)0 (WRITABLE)1 (ACCESSED)0 -> 0010B
    DW 0XFFFF           			; SEGMENT LIMIT(0:15)
    DW 0X0              			; BASE ADDRESS(0:15)
    DB 0X0              			; BASE ADDRESS(16:23)
    DB 10010010B        			; 1ST FLAGS和TYPE FLAGS
    DB 11001111B        			; 2ND FLAGS和SEGMENT LIMIT(16:19)
    DB 0X0              			; BASE ADDRESS(24:31)

GDT_END:

GDT_DESCRIPTOR:
    DW GDT_END - GDT_START - 1  	; GDT的大小
    DD GDT_START                	; GDT的地址



; 填充并设置为启动扇区
TIMES 510 - ($-$$) DB 0
DW 0XAA55

