#include <stdio.h>
#include <stdlib.h>

void print_binary(int number, int nr_bits)
{
unsigned b;
for(b = 1 <<(nr_bits -1); b > 0; b = b/2)
(number & b) ? printf("1") : printf("0");
printf("\n");
}

void check_parity(int *numbers, int n)
{
for(int i = 0; i < 5; i ++) {
if(numbers[i]% 2 ==1){
printf("%x", numbers[i]);

}
else
print_binary(numbers[i], 32);

}
}

int main()
{
int *a = malloc(5 * sizeof(int));
int i = 0;
while(i < 5) {
scanf("%d", &(*(a + i)));
i ++;
}
check_parity(a, 5);

return 0;
}


