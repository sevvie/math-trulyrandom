#vim:setf perl6:
=head1 NAME
Math::TrulyRandom - Perl interface to a cryptographically secure random
number generator.

=head1 SYNOPSIS
    use Math::TrulyRandom;
    my $random = truly-random-value();

=head1 DESCRIPTION
The B<Math::TrulyRandom> module provides an ability to generate crytographically
secure data and values via the operating system's native CSPRNG. This leverages
OpenBSD/LibreSSL code to utilize B<CryptGenRandom()> on Windows, B<getrandom()>
on Linux 3.17+, etc.

unit module Math::TrulyRandom;
use NativeCall;

=head2 truly-random-value()
returns a random 32-bit integer.
=head2 truly-random-uniform($upper_bound)
returns a random 32-bit integer between 0 and $upper_bound, exclusive.
=head2 truly-random-buf($buflen)
returns a Buf with $buflen bytes of random data (max: 256).

constant GETENTROPY = './libgetentropy.so';


sub getentropy_random()
    returns uint32
    is native(GETENTROPY)
    { ... }

sub getentropy_uniform(uint32)
    returns uint32
    is native(GETENTROPY)
    { ... }

sub getentropy_buf(CArray[int8], size_t)
    is native(GETENTROPY)
    { ... }



# Credit: Jonathan Stowe via NativeHelpers::Array
# Copied to avoid dependencies
sub copy-carray-to-buf(CArray $array, Int $no-elems) returns Buf {
    my $buf = Buf.new;
    $buf[$_] = $array[$_] for ^$no-elems;
    $buf;
}



sub truly-random-buf(size_t $buflen) returns Buf is export(:func) {
    my $bytes = CArray[int8].new;
    $bytes[$buflen-1] = 0;
    getentropy_buf($bytes, $buflen);
    copy-carray-to-buf($bytes, $buflen);
}

sub truly-random-value() returns Int is export(:func) {
    getentropy_random();
}

sub truly-random-uniform(uint32 $upper_bound) returns Int is export(:func) {
    getentropy_uniform($upper_bound);
}

=head2 BUGS
SO MANY. See L<http://github.com/sevvie/Math-TrulyRandom/> for more
information. Will fail on OS X if we can't use /dev/urandom.

=head2 COPYRIGHT
This implementation is derived from OpenBSD/LibreSSL code written by
Theo de Raadt, Bob Beck, and Damien Miller. Adaptation of this code for
Perl6 was performed by Shawn Kinkade. Other parts of this extension
are copyright Jennie 'sevvie' Rose ( http://sevvie.tk/ )
