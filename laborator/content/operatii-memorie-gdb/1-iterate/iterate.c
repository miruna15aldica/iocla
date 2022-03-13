#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {
    int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};
    unsigned char *show_char = (unsigned char *) &v;
    unsigned int *show_int = (unsigned int *)&v;
    for(int i = 0; i < sizeof(v) / sizeof(show_char); i++)
        printf("%p -> 0x%x\n", show_char, *show_char);
    for(int i = 0; i < sizeof(v) / sizeof(show_int); i++)
        printf("%p -> 0x%x\n", show_int, *show_int);
   
    return 0;
}
