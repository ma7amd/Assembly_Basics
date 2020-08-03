; Author: Zamba

global _start

_start:
    ; Byte: 8 bits 0x00
    ; Word: 16 bits
    ; Double Word: 32 bits
    ; Quad Word: 64 bits
    ; Double Quad Word: 128 bits 


    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, definebyte1
    mov edx, definebyte1L
    int 0x80

    mov eax, 0x4
    mov ecx, definebyte2
    mov edx, definebyte2L
    int 0x80

    mov eax, 0x4
    mov ecx, defineword
    mov edx, definewordL
    int 0x80


    ; Exit with return code 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

    definebyte1: db "R", 0x0a
    definebyte1L: equ $-definebyte1

    definebyte2: db "Hello World", 0x0a
    definebyte2L: equ $-definebyte2

    defineword: dw "Hello World from another planet!", 0x0a
    definewordL: equ $-defineword
