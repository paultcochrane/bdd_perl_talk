package MoinSayer;

use warnings;
use strict;

use Moose;

sub moin {
    my $self = shift;
    my $name = shift;
    print "moin ", $name, "\n";
}

1;
