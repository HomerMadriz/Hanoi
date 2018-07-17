/*
 ============================================================================
 Name        : Torrestera.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <Math.h>

int A[] = {1, 2, 3};
int size = 3;
int B[8];
int C[8];
int top = 0;

void move(int n, int source[], int target[], int aux[]);

int main(void) {
	//move(size, A, C, B);
	double d = 1 / (pow(.25, 128));
	//float d = -2512662.0432;
	printf("%f", d);
	return 0;
}

void move(int n, int source[], int target[], int aux[]) {
	if(n > 0){
		int i;
		move(n - 1, source, aux, target);

		for(top = 0; top < size; top++){
			if(source[top] != 0)
				break;
		}

		target[top] = source[top];
		source[top] = 0;

		for(i = 0; i < size; i++) {
			printf("%d, %d, %d \n", A[i], B[i], C[i]);
		}
		printf("-------------- \n");

		move(n - 1, aux, target, source);
	}
}

