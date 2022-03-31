#include <stdio.h>

void main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
	int half_way;
bubble:
	if(start == end)
	goto out;
	half_way = start +(end - start)/2;
	if(v[half_way] < dest)
		goto raise_it;
	end = half_way;
	goto bubble;


raise_it:
	start = half_way + 1;
	goto bubble;


out:
	printf("The position is %d and the number is %d\n",start, dest);
/* TODO: Implement binary search */
}


