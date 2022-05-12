%include "../utils/printf32.asm"

section .data
    msg db 'Hello, world!', 0

section .text

extern puts
global main
main:
    push ebp
    mov ebp, esp ; apel de functie

    push msg ;il afiseaza mesajul
    call puts ; apelam functia
    add esp, 4 ;restauram stiva

    leave
    ret
