; Author: Zamba

section .text
global _start

_start:

    ; Open a file
    mov eax, 0x5
    mov ebx, file
    mov ecx, 0x1
    int 0x80

    mov esi, eax  ; saves FD

    ; write to the same file
    mov eax, 0x4
    mov ebx, esi
    mov ecx, string
    mov edx, stringL
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
    string: db "Apart from the, and registers, there are other extra segment registers -  (extra segment),  and , which provide additional segments for storing data.In assembly programming, a program needs to access the memory locations. All memory locations within a segment are relative to the starting address of the segment. A segment begins in an address evenly divisible by 16 or hexadecimal 10. So, the rightmost hex digit in all such memory addresses is 0, which is not generally stored in the segment registers.The segment registers stores the starting addresses of a segment. To get the exact location of data or instruction within a segment, an offset value (or displacement) is required. To reference any memory location in a segment, the processor combines the segment address in the segment register with the offset value of the location.", 0x0a
    stringL equ $-string

section .bss
    buffer resb 0x400