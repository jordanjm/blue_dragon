#! /usr/bin/perl
use strict;
use warnings;

sub round
{
	my $numIn = shift;
	my $round = sprintf("%.2f", $numIn);
	return $round;
}

sub fightScene
{
	my $charStrength = shift;
	my $enemDefence = shift;
	my $hitValue = (($charStrength/2)+(rand($charStrength/2)))-$enemDefence;
	my $hitValueRounded = round ($hitValue);
	return $hitValueRounded;
}

sub main
{
	my $hit = fightScene (8, 7);
	print "$hit\n";
}

main();
