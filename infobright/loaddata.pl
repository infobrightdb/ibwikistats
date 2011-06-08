#!/usr/bin/perl

use lib qw(./lib);
use ibLib;


#call getdata
# unzip
# call loaddata

my $filename    = makefilename();
my $summarytime = makesummarytime();

my $QUERY = <<SQL;

use $database;

set \@bh_dataformat='mysql';

load data infile '$statdir/$filename' into table pagecounts 
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
