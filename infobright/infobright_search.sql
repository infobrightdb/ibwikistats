
SELECT left(projectcode, position("." IN projectcode) - 1) AS 'lang',
       right(projectcode, length(projectcode) - position("." IN projectcode))
          AS 'wiki',
       languagename,
       wikitype,
       pagename,
       pageviews,
       year(summarytime) AS 'year',
       month(summarytime) AS 'month',
       day(summarytime) AS 'day',
       date(summarytime) AS 'date',
       hour(summarytime) AS 'hour',
       summarytime
  FROM (SELECT CASE locate('.', projectcode)
                  WHEN 0 THEN concat(projectcode, '.')
                  ELSE projectcode
               END
                  AS projectcode,
               pagename,
               pageviews,
               summarytime
          FROM (SELECT projectcode,
                       pagename,
                       pageviews,
                       summarytime
                  FROM pagecounts
                 WHERE pagename LIKE '%infobright%') a) b
       JOIN langlookup
          ON languagecode =
                left(projectcode, position("." IN projectcode) - 1)
       LEFT JOIN types
          ON c1 =
                right(projectcode,
                      length(projectcode) - position("." IN projectcode))
ORDER BY projectcode, summarytime, pageviews DESC;
