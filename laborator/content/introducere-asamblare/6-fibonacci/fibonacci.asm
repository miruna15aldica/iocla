%include "printf32.asm"

section .text
    global main
    extern printf

main:
    mov eax, 7  
    mov ebx, 0
    mov ecx, 1
         ; vrem sa aflam al N-lea numar; N = 7

fibo:
    cmp eax, 1
    je out
    sub eax, 1
    mov edx, ebx
    add edx, ecx
    mov ebx, ecx
    mov ecx, edx
    jmp fibo

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
out:
    PRINTF32 `%d\n\x0`, ecx
    ret
