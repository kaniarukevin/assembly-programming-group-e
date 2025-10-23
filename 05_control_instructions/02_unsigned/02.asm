; JAE / JNB → Jump if Above or Equal

section .data
    str_ae db "AX >= BX (Above or Equal)",10,0
    len_ae equ $ - str_ae

    str_below db "AX < BX (Below)",10,0
    len_below equ $ - str_below

    msg db "Hello, this is Kevin Kaniaru, Student No: 164806",10,0
    len_msg equ $ - msg

section .text
    global _start
_start:
    mov eax,5
    mov ebx,5
    cmp eax,ebx
    jae above_equal

    ; AX < BX
    mov ecx, str_below
    mov edx, len_below
    call print_msg
    jmp print_name

above_equal:
    mov ecx, str_ae
    mov edx, len_ae
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
