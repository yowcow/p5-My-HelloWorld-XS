#include <assert.h>
#include <stdio.h>
#include "bit.h"

int main() {
    printf("Testing count_bits() ... ");

    assert(count_bits(4) == 1);
    assert(count_bits(3) == 2);
    assert(count_bits(2) == 1);
    assert(count_bits(1) == 1);
    assert(count_bits(0) == 0);

    printf("Done\n");

    return 0;
}
