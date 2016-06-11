all: bit-test
	./bit-test

bit-test: bit.c bit-test.c
	$(CC) -Wall -Werror -std=c99 -O3 bit.c bit-test.c -o $@
