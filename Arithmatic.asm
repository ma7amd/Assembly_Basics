; Author: Zamba 

global _start

_start:

    ; Addition ##############################################################
    mov al, 0x55
    add al, 0x10


    ; Another case of adding
    ; Here the variable is full with data, so we should assign a CARRY flag
    mov eax, 0xffffffff
    ; "stc" to set the carry flag
    ; "clc" to clear the carry flag
    ; cmc to complement the carry flag, means if it is on it will set it off, and vice versa
    stc
    adc al, 0x10


    ; Substraction ##########################################################
    mov al, 0x20
    sub al, 0x5

    ; In case of using the CARRY flag
    mov eax, 0x20
    stc
    sbb eax, 0x5


    ; Multiplication ########################################################
    ; Roles of Multiplication:
    ; AL * 8 bit = AX
    ; AX * 16 bit = DX & AX
    ; EAX * 32 bit = EDX & EAX
    mov al, 0x10
    mov bl, 0x5
    mul bl



    ; Division ##############################################################
    ; AX / 8 bit = AL & AH
    ; DX & AX / 16 bit = AX & DX
    ; EDX & EAX / 32 bit = EAX & EDX
    mov ax, 0x1000
    mov cx, 0x5
    div cx


    ; for increasing a varibale by one:
    inc eax

    ; for decreasing a variable by one:
    dec eax

    


    ; Exit with return code 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80
