/**
 * Sample header file for a MVS 3.8j project
 */

#ifndef SAMPLE_H
#define SAMPLE_H

/**
 * Prints a greeting message to the operator console using WTO
 *
 * @param name The name to greet
 * @return 0 on success, non-zero on failure
 */
int sample_wto_greeting(char *name) asm("TST0001");

/**
 * Prints a greeting message to the TSO terminal using printf
 *
 * @param name The name to greet
 * @return 0 on success, non-zero on failure
 */
int sample_tso_greeting(char *name) asm("TST0002");

#endif /* SAMPLE_H */ 
