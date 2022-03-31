#include <stdio.h>

void main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max;
	int i;

/* TODO: Implement finding the maximum value in the vector */
	max = v[0];
	i = 1;

kindofwhile:
	if(v[i] <= max)
	goto unuseful;
	max = v[i];

unuseful:
	i++;
	if(i < sizeof(v)/sizeof(int))
		goto kindofwhile;

	printf("MAX IS %d\n", max);


}


