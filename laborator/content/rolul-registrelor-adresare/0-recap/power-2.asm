%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX

power: 
    cmp ebx, eax
    jg close
    test ebx, eax
    jz double
    PRINTF32 `%d\n\x0`, ebx

double:
    shl ebx, 1
    jmp power

close:
    leave
    ret
