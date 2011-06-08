 CREATE TABLE `pagecounts` (
  `summarytime` datetime DEFAULT NULL,
  `projectcode` varchar(25) DEFAULT NULL,
  `pagename` varchar(1024) DEFAULT NULL,
  `pageviews` bigint(20) DEFAULT NULL,
  `bytes` bigint(20) DEFAULT NULL
) ENGINE=BRIGHTHOUSE;

 CREATE TABLE `types` (
  `c1` varchar(5) DEFAULT NULL,
  `wikitype` varchar(128) DEFAULT NULL
) ENGINE=BRIGHTHOUSE;

 CREATE TABLE `langlookup` (
  `languagecode` varchar(25) DEFAULT NULL,
  `languagename` varchar(255) DEFAULT NULL
) ENGINE=BRIGHTHOUSE DEFAULT CHARSET=utf8 ;
