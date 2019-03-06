global  main
extern  myprintf
 
section .text
main:
	push message
	call myprintf
	add esp, 4
	ret
message:
	db 'Hello, World', 10, 0

