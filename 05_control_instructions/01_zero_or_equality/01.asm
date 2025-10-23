section .data
    msg_equal db "AX == BX (Equal, ZF=1)",10,0

    len_equal equ $ - msg_equal


    msg_not_equal db "AX != BX (Not Equal, ZF=0)",10,0
    
    len_not_equal equ $ - msg_not_equal

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806", 10, 0
    len_msg equ $ - msg

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, 5

    cmp eax, ebx
    je equal

    ; not equal
    mov ecx, msg_not_equal
    mov edx, len_not_equal
    call print_msg
    jmp print_name

equal:
    mov ecx, msg_equal
    mov edx, len_equal
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
; Procedure to print message
; -------------------------
print_msg:
    mov eax,4       ; sys_write
    mov ebx,1       ; stdout
    int 0x80
    ret
