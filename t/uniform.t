# vim:ft=perl6:
use v6;
use Test;

use lib 'lib';

use Math::TrulyRandom :func;

my $upper = 10000;
my $val1 = truly-random-uniform($upper);
my $val2 = truly-random-uniform($upper);
my $val3 = truly-random-uniform($upper);

ok ($val1 != $val2 || $val2 != $val3), "truly-random-uniform() output changes";
ok (0 <= $val1 < $upper || 0 <= $val2 < $upper || 0 <= $val3 < $upper),
        "truly-random-uniform() outputs are within range";

done-testing;
