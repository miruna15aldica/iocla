%include "../utils/printf32.asm"

section .data
    mystring db "This is my string", 0
    print_format db "String length is %d", 10, 0

section .text

;extern puts
extern printf
global main

main:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, byte [eax]
    inc eax
    inc ecx
    test bl, bl
    ;je out
    ;inc eax
    ;inc ecx
    jne test_one_byte

    dec ecx
    push ecx
    push print_format
    call printf
    add esp, 8

;out:
    ;PRINTF32 `[PRINTF32]: %d\n[printf]: \x0`, ecx

    leave
    ret
