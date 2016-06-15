#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"
#include "bit.h"

int is_even(int v) {
    return (v % 2) == 0;
}

int sum(int a, int b) {
    return a + b;
}

MODULE = My::HelloWorld::XS    PACKAGE = My::HelloWorld::XS

PROTOTYPES: DISABLE

void
is_even(...)
PPCODE:
{
    if (items != 1) {
        croak("Invalid argument count: %d", items);
    }

    SV* input = ST(0);
    IV ret = is_even(SvIV(input));

    XPUSHs(sv_2mortal(newSViv(ret)));

    XSRETURN(1);
}

void
hello()
PPCODE:
{
    // Should be faster than returning char*
    XPUSHs(newSVpvs_flags("Hello, world!", SVs_TEMP));
    XSRETURN(1);
}

char*
hello_retval()
CODE:
    // Should be slower than directly returning SV*
    SV* out = newSVpvs_flags("Hello, world!", SVs_TEMP);
    RETVAL = SvPV_nolen(out);
OUTPUT:
    RETVAL

void
sum(...)
PPCODE:
{
    if (items != 2) {
        croak("Invalid argument count: %d", items);
    }

    SV* a = ST(0);
    SV* b = ST(1);

    IV ret = sum(SvIV(a), SvIV(b));

    XPUSHs(sv_2mortal(newSViv(ret)));

    XSRETURN(1);
}

void
bits(...)
PPCODE:
    if (items != 1) {
        croak("Invalid argument count: %d", items);
    }

    IV ret = count_bits(SvIV(ST(0)));

    XPUSHs(sv_2mortal(newSViv(ret)));

    XSRETURN(1);
