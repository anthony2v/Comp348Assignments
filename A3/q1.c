// MxN Matrix Transpose
#include <stdio.h>

void matrixTranspose(int array[3][3]) {
	int i, j, transpose[3][3];
	printf("Before:\n");
	for(i = 0; i < 3; i++) {
		for(j = 0; j < 3; j++) {
			printf("%d\t", array[i][j]);
		}
		printf("\n");
	}
	for(i = 0; i < 3; i++) {
		for(j = 0; j < 3; j++) {
			transpose[j][i] = array[i][j];
		}
	}
	printf("After:\n");
	for(i = 0; i < 3; i++) {
		for(j = 0; j < 3; j++) {
			printf("%d\t", transpose[i][j]);
		}
		printf("\n");
	}
}

void matrixTranspose2(int array[5][2]) {
	int i, j, length, width;
	length = (int)(sizeof(array) / sizeof(int));
	width = (int)(sizeof(array[0]) / sizeof(int));
	int transpose[width][length];
	for(i = 0; i < length; i++) {
		for(j = 0; j < width; j++) {
			transpose[j][i] = array[i][j];
		}
	}
	for(i = 0; i < width; i++) {
		for(j = 0; j < length; j++) {
			printf("%d\t", transpose[i][j]);
		}
		printf("\n");
	}
}

void main() {
	int test[5][2];
	for(int i = 0; i < 5; i++) {
		for(int j = 0; j < 2; j++) {
			test[i][j] = i;
		}
	}
	matrixTranspose2(test);
}