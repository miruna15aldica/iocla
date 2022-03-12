#include <stdio.h>

void rotate_left(int *number, int bits)
{
int aux = *number;
int i = 1;
while(i <= bits) {
*number = (*number <<1);
i++;
}
*number = *number + (aux >>31);
printf("%d\n", *number);
}

void rotate_right(int *number, int bits)
{
int i = 1;
while(i <= bits) {
*number = (*number >>1) + (*number <<31);
i++;
}
printf("%d\n", *number);
}

int main()
{
int a;
scanf("%d", &a);
rotate_right(&a, 1);
rotate_left(&a, 2);

return 0;
}


