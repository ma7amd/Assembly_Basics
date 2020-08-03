; Author: Zamba

global _start

_start:

    ; Open file
    mov eax, 0x5
    mov ebx, file
    mov ecx, 0x0
    int 0x80

    mov esi, eax     ; esi is the FD for the opened filw

    ; read data from file
    mov eax, 0x3
    mov ebx, esi
    mov ecx, buffer
    mov edx, 0x400
    int 0x80

    ; write the data to the screen
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, buffer
    mov edx, 0x400
    int 0x80

    ; Close the file
    mov eax, 0x6
    mov ebx, esi
    int 0x80
    
    
    ; Exit with return value 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80

    file: db "./text.txt", 0x0

section .bss
    buffer resb 0x400   ; reserving 1024 bits