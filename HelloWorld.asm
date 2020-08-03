; Author: Zamba

global _start

_start:
    ; Sets syscall value 4 AKA write to be used
    mov eax, 0x4
    ; Set it to standard output
    mov ebx, 0x1
    ; Define a variable
    mov ecx, string
    ; Define the length of that variable
    mov edx, stringL
    ; to execute this syscall
    int 0x80
    
    ; Exiting our syscall normally
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80
    
    
    ; Defining the value of our variable STRING, 0x0a = \n is a decimal represintation for new line
    string: db "Hello World!", 0x0a
    ; getting the length by substrating the memory position of the ending string = "$", from the memory location of the first charchter "H"
    stringL: equ $-string