#!/usr/bin/perl

use lib qw(./lib);
use ibLib;

my $outfile = makefilename(".gz");
my $URL     = makeurl($outfile);
print "#".$URL ;
print "\n#getting now...\n";
getdata( $URL, $outfile );
print "\n\n";
print "gunzip $outfile\n";

