; JP / JPE → Jump if Parity Even
section .data
    msg_intro db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_intro equ $ - msg_intro

    msg_even db "Parity Even (PF=1)",10,0
    len_even equ $ - msg_even

    msg_odd db "Parity Odd (PF=0)",10,0
    len_odd equ $ - msg_odd

section .text
    global _start
_start:
    ; First print intro message
    mov eax,4
    mov ebx,1
    mov ecx, msg_intro
    mov edx, len_intro
    int 0x80

    ; Now test for parity
    mov al,3       ; 00000011b → two 1s → even parity
    test al,al
    jp even

    mov ecx, msg_odd
    mov edx, len_odd
    jmp print

even:
    mov ecx, msg_even
    mov edx, len_even

print:
    mov eax,4
    mov ebx,1
    int 0x80

    ; Exit program
    mov eax,1
    xor ebx,ebx
    int 0x80
