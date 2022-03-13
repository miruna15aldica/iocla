#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* delete_first(char *s, char *pattern) {
	int length = strlen(pattern);
	int found = strlen(s);
	char *lookfor = strstr(s, pattern);
	if(lookfor) {
		int before_s = (lookfor) - (s);
		char *new_word = malloc( found +1 - length);
		strncpy(new_word, s, before_s);
		strcpy(new_word + before_s, lookfor + length);
		return new_word;
	}
	else {
		return 0;
	}
}

int main(){
	char *s = "Ana are mere";
	char *pattern = "re";

	printf("%s\n", delete_first(s, pattern));

	return 0;
}
