; JNO → Jump if No Overflow

section .data
    msg_ov db "Overflow (OF=1)",10,0
    len_ov equ $ - msg_ov

    msg_noov db "No overflow (OF=0)",10,0
    len_noov equ $ - msg_noov

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_msg equ $ - msg

section .text
    global _start
_start:
    mov eax,5
    add eax,2
    jno nooverflow

    ; Overflow case
    mov ecx, msg_ov
    mov edx, len_ov
    call print_msg
    jmp print_name

nooverflow:
    mov ecx, msg_noov
    mov edx, len_noov
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
