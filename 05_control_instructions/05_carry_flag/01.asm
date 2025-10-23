; JC → Jump if Carry

section .data
    msg_carry db "Carry occurred (CF=1)",10,0
    len_carry equ $ - msg_carry

    msg_nocarry db "No carry (CF=0)",10,0
    len_nocarry equ $ - msg_nocarry

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_msg equ $ - msg

section .text
    global _start
_start:
    mov eax,0FFFFh
    add eax,1       ; sets CF=1
    jc carry

    ; no carry branch
    mov ecx, msg_nocarry
    mov edx, len_nocarry
    call print_msg
    jmp print_name

carry:
    mov ecx, msg_carry
    mov edx, len_carry
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
