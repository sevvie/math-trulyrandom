# vim:ft=perl6:
use v6;
use Test;

use lib 'lib';

use Math::TrulyRandom :func;

my $val1 = truly-random-value();
my $val2 = truly-random-value();
my $val3 = truly-random-value();

ok ($val1 != $val2 || $val2 != $val3), "truly-random-value() output changes";

done-testing;
