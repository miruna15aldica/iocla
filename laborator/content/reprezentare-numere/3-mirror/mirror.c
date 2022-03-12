#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mirror(char *s)
{
int i ;
for(i = 0; i <strlen(s)/2; i++) {
char aux = *(s + i);
*(s + i) = *(s + strlen(s) - i - 1);
*(s + strlen(s) - i - 1) = aux;
}
printf("%s\n", s);
}

int main()
{
char *a = malloc(128 * sizeof(char));
scanf("%s", a);
mirror(a);


return 0;
}


