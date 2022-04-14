%include "../utils/printf32.asm"

; https://en.wikibooks.org/wiki/X86_Assembly/Arithmetic

section .data
    string_quotient db "Quotient: ", 0
    string_remainder db "Remainder: ", 0
    dividend1 db 91
    divisor1 db 27
    dividend2 dd 67254
    divisor2 dw 1349
    dividend3 dq 69094148
    divisor3 dd 87621

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    xor eax, eax

    mov al, byte [dividend1]
    mov bl, byte [divisor1]
    div bl
    
    PRINTF32 `%s\x0`, string_quotient
    xor ebx, ebx
    mov bl, al
    PRINTF32 `%hhu\n\x0`, ebx
    xor ebx, ebx
    mov bl, ah
    PRINTF32 `%s\x0`, string_remainder
    PRINTF32 `%hhu\n\x0`, ebx

    mov edx, [dividend2]
    mov al, blshr edx, 16
    mov bl, word [divisor2]
    div bl


    PRINTF32 `%s\x0`, string_quotient
    xor ebx, ebx
    mov bl, al
    PRINTF32 `%hhu\n\x0`, ebx
    xor ebx, ebx
    mov bl, ah
    PRINTF32 `%s\x0`, string_remainder
    PRINTF32 `%hhu\n\x0`, ebx

    mov eax, dword [dividend3]
    mov ebx, dword [dividend3+4]
    mov ecx, dword[divisor3]
    div ecx
    ; TODO: Calculate quotient and remainder for 67254 / 1349.
    PRINTF32 `%s\x0`, string_quotient
    xor ebx, ebx
    mov bl, al
    PRINTF32 `%hhu\n\x0`, ebx
    xor ebx, ebx
    mov bl, ah
    PRINTF32 `%s\x0`, string_remainder
    PRINTF32 `%hhu\n\x0`, ebx

    ; TODO: Calculate quotient and remainder for 69094148 / 87621.
    
    leave
    ret
