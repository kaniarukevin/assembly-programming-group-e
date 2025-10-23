; JNS → Jump if Not Sign

section .data
    msg_neg db "Negative (SF=1)",10,0
    len_neg equ $ - msg_neg

    msg_nonneg db "Non-Negative (SF=0)",10,0
    len_nonneg equ $ - msg_nonneg

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_msg equ $ - msg

section .text
    global _start
_start:
    mov eax,5        ; test value (positive number)
    test eax,eax
    jns nonneg

    ; if negative
    mov ecx, msg_neg
    mov edx, len_neg
    call print_msg
    jmp print_name

nonneg:
    mov ecx, msg_nonneg
    mov edx, len_nonneg
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
