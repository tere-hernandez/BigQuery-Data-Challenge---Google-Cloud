-- This query will help you find the monthly top pages by pageviews of the mobile Wikipedia in English
SELECT  *
FROM    (
        SELECT  month, 
                ARRAY_AGG(STRUCT(SUBSTR(title,0,21) as title, views) ORDER BY views DESC LIMIT 5) as title_data
        FROM (
          SELECT  DATE_TRUNC(date, MONTH) month, 
                  title, 
                  SUM(views) as views
          FROM    `fh-bigquery.wikipedia_extracts.2019_en_m_daily`
          WHERE   title NOT LIKE 'File%' --and title = 'The_Mandalorian'
          GROUP BY month, title    
        )
        GROUP BY 1
        ORDER BY month
        )
WHERE EXISTS (SELECT title FROM UNNEST(title_data) WHERE title = 'The_Mandalorian')
