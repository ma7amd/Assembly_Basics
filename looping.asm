; Author: Zamba

global _start

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
    mov ecx, 0x10
    call main

main:

    pushad
    pushfd

    call print

    popfd
    popad

    loop main

    ; Exit with return code 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

    string: db "Hello World", 0x0a
    stringL equ $-string