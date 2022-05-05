%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov dword [esp], ecx
    ;push ecx
    loop push_nums

    sub esp, 4
    mov dword [esp], 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are"
    sub esp, 4
    mov dword [esp], "Ana"
    ;push 0
    ;push "mere"
    ;push "are "
    ;push "Ana "

    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov eax, ebp
    ;PRINTF32 `0x\x0`
final_print:
    PRINTF32 `0x\x0`
    PRINTF32 `%x\x0`, eax
    PRINTF32 `0x\x0`
    PRINTF32 `%x\n\x0`, [eax]

    ; TODO 3: print the string
    sub eax, 4
    cmp eax, esp
    jge final_print
    ; TODO 4: print the array on the stack, element by element.
    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
