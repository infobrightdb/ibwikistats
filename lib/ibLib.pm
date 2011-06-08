#!/usr/bin/perl

use warnings;
use strict;

use Getopt::Long;
use Data::Dumper;
use WWW::Curl::Easy;

## defaults

$| = 1;

my $DEBUG    = 0;
my $data     = "./data";
my $database = "wiki1";
my $host     = "10.20.30.81";
my $port     = "54321";
my $user     = "wiki";
my $password = "pedia";
my $year     = 2011;
my $month    = 5;
my $day      = 25;
my $hour     = 20;

GetOptions(
    'data=s'     => \$data,
    'DEBUG=s'    => \$DEBUG,
    'db=s'       => \$database,
    'host=s'     => \$host,
    'user=s'     => \$user,
    'password=s' => \$password,
    'year=s'     => \$year,
    'month=s'    => \$month,
    'day=s'      => \$day,
    'hour=s'     => \$hour,

);

sub makefilename {
    my ($suffix) = @_;
    my $filename = "pagecounts-";
    if ( $month < 10 ) { $month = "0" . $month }
    if ( $day < 10 )   { $day   = "0" . $day }
    if ( $hour < 10 )  { $hour  = "0" . $hour }
    $filename .= $year . $month . $day . "-" . $hour . "0000";
    return $filename . $suffix;
}

sub makesummarytime {
    my $stime = $year . "-" . $month . "-" . $day . " " . $hour . ":00:00";
    return $stime;
}

=pod
data source URL example:
http://dammit.lt/wikistats/pagecounts-20110601-200000.gz

second set is a rollup query on above, subset of above data
http://dammit.lt/wikistats/projectcounts-20110531-210000

=cut

sub getdata {
    ## could use a better module, using module installed on current machine
    my ( $url, $outfile ) = @_;
    my $curl = WWW::Curl::Easy->new;

    open( my $mydata, '>', "./$outfile" );
    $curl->setopt( CURLOPT_URL, $url );

    #$curl->setopt( CURLOPT_READDATA, \$mydata );
    $curl->setopt( CURLOPT_WRITEDATA, \$mydata );
    my $retcode = $curl->perform();
    if ( $retcode == 0 ) {

        #print Dumper($mydata);
        print "#file retreived\n\n";

    }
    else {
        die "error on curl "
          . $curl->strerror($retcode) . " "
          . $curl->errbuf . "\n";
    }

}

sub makeurl {
    my ($filename) = @_;
    my $url = "http://dammit.lt/wikistats/";
    $url .= $filename;
    return $url;
}

1;
