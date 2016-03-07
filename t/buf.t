# vim:ft=perl6:
use v6;
use Test;

use lib 'lib';

use Math::TrulyRandom :func;

my $bytes = 32;
my $val1 = truly-random-buf($bytes);
my $val2 = truly-random-buf($bytes);

ok ($val1.elems == $bytes || $val2.elems == $bytes),
        "truly-random-buf() outputs hold correct number of bytes";

my $bufs_differ = False;
for 0 .. $bytes - 1 {
    if $val1[$_] != $val2[$_] {
        $bufs_differ = True;
    }
}
ok ($bufs_differ), "truly-random-buf() outputs hold different values";

done-testing;
