package My::HelloWorld::XS;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=encoding utf-8

=head1 NAME

My::HelloWorld::XS - It's new $module

=head1 SYNOPSIS

    use My::HelloWorld::XS;

=head1 DESCRIPTION

My::HelloWorld::XS is ...

=head1 LICENSE

Copyright (C) yowcow.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

yowcow E<lt>yowcow@cpan.orgE<gt>

=cut

