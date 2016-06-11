use strict;
use Test::More;

use My::HelloWorld::XS;

is(My::HelloWorld::XS::hello(), 'Hello, world!');

done_testing;

