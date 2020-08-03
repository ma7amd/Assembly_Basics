; Author: Zamba

global _start

PrintText:
    push ebp
    mov ebp, esp

    mov eax, 0x4
    mov ecx, string
    mov edx, stringL
    int 0x80

    leave
    ret

    

_start:

    pushad
    pushfd

    call PrintText

    popfd
    popad
  

    ; Exit with return value 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80


    string: db "Hello World", 0x0a
    stringL: equ $-string
