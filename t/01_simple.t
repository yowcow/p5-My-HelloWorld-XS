use strict;
use warnings;
use Devel::Peek;
use Test::Exception;
use Test::More;
use My::HelloWorld::XS;

subtest 'Test hello()' => sub {
    my $hello = My::HelloWorld::XS::hello();

    is $hello, 'Hello, world!';
};

subtest 'Test hello_retval()' => sub {
    my $hello = My::HelloWorld::XS::hello_retval();

    is $hello, 'Hello, world!';
};

subtest 'Test sum()' => sub {

    subtest 'Invalid argument count' => sub {
        throws_ok { My::HelloWorld::XS::sum(1) } qr!Invalid argument count!;
    };

    subtest 'Sums up 2 arguments' => sub {
        is My::HelloWorld::XS::sum(2, 4), 6;
    };
};

subtest 'Test is_even' => sub {
    ok My::HelloWorld::XS::is_even(2);
    ok !My::HelloWorld::XS::is_even(1);
    throws_ok { My::HelloWorld::XS::is_even(2, 2, 2) } qr|Invalid argument count|;
};

subtest 'Test bits' => sub {
    throws_ok { My::HelloWorld::XS::bits(1, 2, 3) } qr|Invalid argument count|;
    is My::HelloWorld::XS::bits(0), 0;
    is My::HelloWorld::XS::bits(1), 1;
    is My::HelloWorld::XS::bits(2), 1;
    is My::HelloWorld::XS::bits(3), 2;
    is My::HelloWorld::XS::bits(4), 1;
};

done_testing;
