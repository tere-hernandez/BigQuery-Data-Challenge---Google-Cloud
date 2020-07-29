-- This query search the top page views at english Wikipedia about babyies in may 2019
SELECT  title, sum(views) as views
FROM    `bigquery-public-data.wikipedia.pageviews_2019` 
WHERE DATE(datehour) BETWEEN '2019-05-01' AND '2019-05-31'
      AND wiki LIKE 'en%'
      AND title LIKE 'Baby%'
      -- AND upper(title) LIKE 'BABY%'    -- 2	Baby_Driver  120174
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1000


-- Validating data:
-- Condition exact word Baby at the beginning of the page name: AND title LIKE 'Baby%' (ORIGINAL) -> 691,302 rows
-- Condition exact word BABY at the beginning of the page name: AND upper(title) LIKE 'BABY%' -> 712,256
-- Lower case letters are required to get all possible results

-- Condition page name is BABY exact word: AND upper(title)  = 'BABY' -> 7,859 rows
-- Condition with word BABY into any position in the page name: AND upper(title) LIKE '%BABY%' -> 1,738,066 rows
-- Condition exact word baby into any position in the page name: AND title LIKE '%baby%' -> 166,333 rows
