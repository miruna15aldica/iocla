%include "../utils/printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp
    mov esi, source_text
    mov edi, substring
loop_source:
    mov eax, esi
    mov edx, edi

loop_sub:
    cmp byte [edx], 0
    je found_suub
    mov bl, byte [eax]
    cmp byte [edx], bl
    inc edx
    inc eax
    jmp loop_sub
found_suub:
    pusha
    mov edx, esi
    sub edx, source_text
    push edx
    push print_format
    call printf
    add esp, 8
    popa
exit_loop:
    inc esi
    cmp byte [esi], 0
    je exit
    jmp loop_source
  
    ; TODO: Print the start indices for all occurrences of the substring in source_text
exit:
    leave
    ret
