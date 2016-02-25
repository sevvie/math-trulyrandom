#vim:setf perl6:
=head1 NAME
Math::TrulyRandom - Perl interface to a truly random number generator.

=head1 SYNOPSIS
    use Math::TrulyRandom;
    my $random = truly-random-value; # also aliased as truerand

=head1 DESCRIPTION
The B<Math::TrulyRandom> module provides an ability to generate truly-
random numbers from within Perl programs. The source of this randomness
is supposed to be from interrupt timing discrepancies, but the underlying
C that powers the Perl5 module is fraught with errors on CPANTS, so better
solutions are being researched.

unit module Math::TrulyRandom;
use NativeCall;

=head2 truly-random-value()
returns a truly-random 16-bit integer.

sub truly-random-value
    is native('truerand')
    is export(:func) {
      ...
    }

=head2 BUGS
SO MANY. See L<http://github.com/sevvie/Math-TrulyRandom/> for more
information.

=head2 COPYRIGHT
This implementation is a lazy derivative of the Perl5 implementation of the
truly-random number generator function, developed by Matt Blaze and Don
Mitchell, which is copyright of AT&T. Other parts of this extension are
copyright of Systemics Ltd ( http://www.systemics.com/ ) and Jennie 'sevvie'
Rose ( http://sevvie.tk/ )
