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


 CREATE TABLE `pagecounts` (
  `summarytime` datetime DEFAULT NULL,
  `projectcode` varchar(25) DEFAULT NULL,
  `pagename` varchar(1024) DEFAULT NULL,
  `pageviews` bigint(20) DEFAULT NULL,
  `bytes` bigint(20) DEFAULT NULL
) ENGINE=BRIGHTHOUSE;

 CREATE TABLE `types` (
  `wikicode` varchar(5) DEFAULT NULL,
  `wikitype` varchar(128) DEFAULT NULL
) ENGINE=BRIGHTHOUSE;

 CREATE TABLE `langlookup` (
  `languagecode` varchar(25) DEFAULT NULL,
  `languagename` varchar(255) DEFAULT NULL
) ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8 ;
