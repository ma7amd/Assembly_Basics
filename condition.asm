; Author: Zamba

global _start

setupFunction:
    mov ecx, 0x5
    jmp finalMethod


print:
    push ebp
    mov ebp, esp

    mov eax, 0x4
    mov ecx, string
    mov edx, stringL
    int 0x80

    leave
    ret


_start:
    jmp setupFunction


finalMethod:
    push ecx

    pushad
    pushfd

    call print

    popfd
    popad

    pop ecx

    dec ecx

    jnz finalMethod

    ; Exit with return value 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80
    

    string: db "Hello World", 0x0a
    stringL equ $-string