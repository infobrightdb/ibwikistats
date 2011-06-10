#!/usr/bin/perl

###########################################################
###                   Infobright 2011                   ###
###            Developed by: twongkee                   ###
###                 Author: Todd Wongkee                ###
###                     Version 0.1                     ###
###                                                     ###
### v0.1: Infobright                                    ###
###                                                     ###
### The MIT License                                     ###
###                                                     ###
### Copyright (c) 2010 Infobright Inc.                  ###
###                                                     ###
### Permission is hereby granted, free of charge, to    ###
### any person obtaining a copy of this software and    ###
### associated documentation files (the "Software"), to ###
### deal in the Software without restriction, including ###
### without limitation the rights to use, copy, modify, ###
### merge, publish, distribute, sublicense, and/or sell ###
### copies of the Software, and to permit persons to    ###
### whom the Software is furnished to do so, subject to ###
### the following conditions:                           ###
###                                                     ###
### The above copyright notice and this permission      ###
### notice shall be included in all copies or           ###
### substantial portions of the Software.               ###
###                                                     ###
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY  ###
### OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT  ###
### LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       ###
### FITNESS FOR A PARTICULAR PURPOSE AND NON-           ###
### INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR      ###
### COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES  ###
### OR OTHER LIABILITY, WHETHER IN AN ACTION OF         ###
### CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF   ###
### OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR    ###
### OTHER DEALINGS IN THE SOFTWARE.                     ###
###########################################################



use warnings;
use strict;

use Getopt::Long;
use Data::Dumper;
use WWW::Curl::Easy;

## defaults

$| = 1;

my $DEBUG    = 0;
my $data     = "./data";
my $database = "wikistats";
my $host     = "127.0.0.1";
my $port     = "54321";
my $user     = "wiki";
my $password = "pedia";
my $year     = 2011;
my $month    = 5;
my $day      = 25;
my $hour     = 20;
my $min      = 0;
my $sec      = 0;
my $staturl  = "http://dammit.lt/wikistats/";
my $statdir  = '/wikistats/working/input/';

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
    'min=s'      => \$min,
    'sec=s'      => \$sec,
    'staturl=s'  => \$staturl,
    'statdir=s'  => \$statdir,

);

sub makefilename {
    my ($suffix) = @_;
    my $filename = "pagecounts-";
    if ( $month < 10 ) { $month = "0" . $month }
    if ( $day < 10 )   { $day   = "0" . $day }
    if ( $hour < 10 )  { $hour  = "0" . $hour }
    if ( $min < 10 )   { $hour  = "0" . $hour }
    if ( $sec < 10 )   { $hour  = "0" . $hour }
    $filename .= $year . $month . $day . "-" . $hour . $min . $sec;
    return $filename . $suffix;
}

sub makesummarytime {
    my $stime =
      $year . "-" . $month . "-" . $day . " " . $hour . ":" . $min . ":" . $sec;
    return $stime;
}

=pod
data source URL example:
http://dammit.lt/wikistats/pagecounts-20110601-200000.gz

last second may be 01

second set is a rollup query on above, subset of above data
so not downloaded
http://dammit.lt/wikistats/projectcounts-20110531-210000

=cut

sub getdata {
    ## could use a better module, using module installed on current machine
    my ( $url, $outfile ) = @_;
    my $curl = WWW::Curl::Easy->new;

    open( my $mydata, '>', "./$outfile" );
    $curl->setopt( CURLOPT_URL, $url );

    $curl->setopt( CURLOPT_WRITEDATA, \$mydata );
    my $retcode = $curl->perform();
    if ( $retcode == 0 ) {

        print Dumper($mydata) if $DEBUG > 2;
        print "#file retreived\n\n";

    }
    else {
        die "# error on curl "
          . $curl->strerror($retcode) . " "
          . $curl->errbuf . "\n";
    }

}

sub makeurl {
    my ($filename) = @_;
    my $url = $staturl;
    $url .= $filename;
    return $url;
}

1;
