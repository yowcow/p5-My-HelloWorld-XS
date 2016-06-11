#include "bit.h"

uint32_t
count_bits(uint32_t val) {
    uint32_t c;

    c = 0;
    while (val != 0) {
        c += 1;
        val = val & (val - 1);
    }

    return c;
}
