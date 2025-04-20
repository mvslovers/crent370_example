#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <clibwto.h>
#include "sample.h"

static int format_greeting(char *buffer, char *name);

int 
sample_wto_greeting(char *name)
{
	char buffer[80];
	int result = 0;
	
	result = format_greeting(buffer, name);
	if (result != 0) {
		wtof("DMY01E Error formatting greeting message\n");
		return 1;
	}
	
	wtof("DMY01I %s\n", buffer);
	return 0;
}

int 
sample_tso_greeting(char *name)
{
	char buffer[80];
	int result;
	
	result = format_greeting(buffer, name);
	if (result != 0) {
		printf("Error formatting greeting message\n");
		return 1;
	}
	
	printf("%s\n", buffer);
	return 0;
}

__asm__("\n&FUNC    SETC 'format_greeting'");
static int 
format_greeting(char *buffer, char *name)
{
	if (buffer == NULL || name == NULL) {
		return 1;
	}
	
	strcpy(buffer, "Hello, ");
	strcat(buffer, name);
	strcat(buffer, "! Welcome to MVS 3.8j programming.");
	
	return 0;
} 
