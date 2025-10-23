; JL / JNGE → Jump if Less

section .data
    msg_less db "AX < BX (Signed Less)",10,0
    len_less equ $ - msg_less

    msg_not_less db "AX >= BX (Not Less)",10,0
    len_not_less equ $ - msg_not_less

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_msg equ $ - msg

section .text
    global _start
_start:
    mov eax,2
    mov ebx,5
    cmp eax,ebx
    jl less

    ; not less
    mov ecx, msg_not_less
    mov edx, len_not_less
    call print_msg
    jmp print_name

less:
    mov ecx, msg_less
    mov edx, len_less
    call print_msg

print_name:
    mov ecx, msg
    mov edx, len_msg
    call print_msg

    ; exit
    mov eax,1
    xor ebx,ebx
    int 0x80

; -------------------------
; Procedure: print message
; -------------------------
print_msg:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80
    ret
