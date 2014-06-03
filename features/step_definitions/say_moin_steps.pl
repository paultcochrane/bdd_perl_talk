#!perl

use warnings;
use strict;

use Test::More;
use Test::BDD::Cucumber::StepFile;
use Method::Signatures;
use Capture::Tiny ':all';

Given qr/^a MoinSayer object$/, func($context) {
    use MoinSayer;
    my $sayer = MoinSayer->new(name => $1);
    ok( $sayer, "Object created" );
    $context->stash->{'scenario'}->{'object'} = $sayer;
};

When qr/^I say "moin" to "(\w+)"$/, func($context) {
    my $stdout = capture_stdout {
	$context->stash->{'scenario'}->{'object'}->moin($1);
    };
    $context->stash->{'scenario'}->{'stdout'} = $stdout;
};

Then qr/^I should see the message "moin (\w+)"$/, func($context) {
    my $stdout = $context->stash->{'scenario'}->{'stdout'};
    like( $stdout, qr/moin $1/, "Said expected greeting" );
};
