#include <stdio.h>
#include "sample.h"

/**
 * Main entry point
 */
int 
main(void)
{
	int rc = 0;
	
	char username[9] = "TSO_USER";
	
	/* Call the WTO greeting (visible in system log) */
	rc = sample_wto_greeting(username);
	if (rc != 0) {
		printf("WTO greeting failed with rc=%d\n", rc);
		return 1;
	}
	
	/* Call the TSO greeting (visible on terminal) */
	rc = sample_tso_greeting(username);
	if (rc != 0) {
		printf("TSO greeting failed with rc=%d\n", rc);
		return 2;
	}
	
	return 0;
} 
