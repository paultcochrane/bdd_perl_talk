#!perl

use warnings;
use strict;

use Test::More;
use Test::BDD::Cucumber::StepFile;
use Method::Signatures;
use Capture::Tiny ':all';

Given qr/a MoinSayer object/, func($c) {
    use MoinSayer;
    my $sayer = MoinSayer->new(name => $1);
    ok( $sayer, "Object created" );
    $c->stash->{'scenario'}->{'object'} = $sayer;
};

When qr/I say "moin" to "(\w+)"/, func($c) {
    my $stdout = capture_stdout {
	$c->stash->{'scenario'}->{'object'}->moin($1);
    };
    $c->stash->{'scenario'}->{'stdout'} = $stdout;
};

Then qr/I should see the message "moin (\w+)"/, func($c) {
    my $stdout = $c->stash->{'scenario'}->{'stdout'};
    like( $stdout, qr/moin $1/, "Said expected greeting" );
};
