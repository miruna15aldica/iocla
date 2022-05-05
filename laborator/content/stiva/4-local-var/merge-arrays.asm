%include "../utils/printf32.asm"

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

section .data

array_1 db 27, 46, 55, 83, 84
array_2 db 1, 4, 21, 26, 59, 92, 105
array_output times 12 db 0


section .text

extern printf
global main
main:
    mov eax, 0 ; counter used for array_1
    mov ebx, 0 ; counter used for array_2
    mov ecx, 0 ; counter used for the output array
    sub esp, ARRAY_1_LEN
    sub esp, ARRAY_2_LEN
    sub esp, ARRAY_OUTPUT_LEN

    mov byte [ebp - ARRAY_1_LEN], 27
    mov byte [ebp - ARRAY_1_LEN + 1], 46
    mov byte [ebp - ARRAY_1_LEN + 2], 55
    mov byte [ebp - ARRAY_1_LEN + 3], 83
    mov byte [ebp - ARRAY_1_LEN + 4], 84

    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN], 1
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 1], 4
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 2], 21
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 3], 26
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 4], 59
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 5], 92
    mov byte [ebp - ARRAY_1_LEN - ARRAY_2_LEN + 6], 105

merge_arrays:
    mov dl, byte [array_1 + eax]
    mov dh, byte [array_2 + ebx]
    cmp dl, dh
    jg array_2_lower
array_1_lower:
    mov byte [array_output + ecx], dl
    inc eax
    inc ecx
    jmp verify_array_end
array_2_lower:
    mov byte [array_output + ecx], dh
    inc ecx
    inc ebx

verify_array_end:
    cmp eax, ARRAY_1_LEN
    jge copy_array_2
    cmp ebx, ARRAY_2_LEN
    jge copy_array_1
    jmp merge_arrays

copy_array_1:
    mov dl, byte [array_1 + eax]
    mov byte [array_output + ecx], dl
    inc ecx
    inc eax
    cmp eax, ARRAY_1_LEN
    jb copy_array_1
    jmp print_array
copy_array_2:
    mov dh, byte [array_2 + ebx]
    mov byte [array_output + ecx], dh
    inc ecx
    inc ebx
    cmp ebx, ARRAY_2_LEN
    jb copy_array_2

print_array:
    PRINTF32 `Array merged:\n\x0`
    mov ecx, 0
print:
    mov al, byte [array_output + ecx]
    PRINTF32 `%d \x0`, eax
    inc ecx
    cmp ecx, ARRAY_OUTPUT_LEN
    jb print

    PRINTF32 `\n\x0`
    xor eax, eax
    ret
    
