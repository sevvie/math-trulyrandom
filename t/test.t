# vim:ft=perl6:
use v6;
use Test;

use lib 'lib';

=head1 how do you test randomness?
Or, in the perl5 port's words, "How on earth do we test for randomness?"

use Math::TrulyRandom :func;

=head2 well, we fake it.
these functions are all synonyms of each other.

my $val1 = truly_random_value;
my $val2 = truly-random-value;
my $val3 = true-rand;

ok ($val1 != $val2 || $val2 != $val3), "var1 is not var2 is not var3. oslt.";

done-testing;
