#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int power(int i) {
int p = 1, x;
for(x = 0; x < i; x ++)
p = p * 2;
return p;
}
int my_strlen(const char *str)
{ int i ;
for(i = 0; *(str + i) != '\0'; i++) {
;
}
return i;
}

void equality_check(const char *str)
{
for(int i = 0; i < my_strlen(str); i++) {
if(i + power(i) >= my_strlen(str)){
if(!(*(str + i) - *(str + ((i + power(i))% my_strlen(str)))))
printf("Address %p\n", str + i);

}
else
{
if(!(*(str + i)-*(str + i + power(i))))
printf("Address %p\n", str + i);

}
}
}


int main(void)
{
char *a = malloc(128 * sizeof(char));
scanf("%s", a);
printf("the word is %s and has a lenght of %d\n", a, my_strlen(a));
equality_check(a);

return 0;
}


