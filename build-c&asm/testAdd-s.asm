global add					; 等同于 c 的 extern

section .data

section .text

add:
    mov   eax, [esp+4]   	; argument 1
    add   eax, [esp+8]   	; argument 2
    ret
    

    