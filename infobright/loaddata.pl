#!/usr/bin/perl

use lib qw(./lib);
use ibLib;


#call getdata
# unzip
# call loaddata

my $datadir     = '/qa/datasets/wikistats/working/input/';
my $filename    = makefilename();
my $summarytime = makesummarytime();

my $QUERY = <<SQL;

use wiki1;

set \@bh_dataformat='mysql';

load data infile '$datadir/$filename' into table pagecounts 
fields terminated by ' '
(
 projectcode ,
  pagename ,
  pageviews ,
  bytes
) 
set summarytime='$summarytime'

;
SQL

print $QUERY;

print "\n\n\n";
