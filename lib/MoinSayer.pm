package MoinSayer;

use warnings;
use strict;

use Moose;

has 'name' => (
    is => 'ro',
    isa => 'Str',
);

sub moin {
    my $self = shift;
    print "moin ", $self->name, "\n";
}

1;
