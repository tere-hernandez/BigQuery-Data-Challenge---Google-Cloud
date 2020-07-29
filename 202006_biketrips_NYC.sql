-- The goal for this query is to get the most frequent bicycle trips in New York City during april 2018.
SELECT  end_station_name , COUNT(*) c
FROM    `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE   DATETIME_TRUNC(stoptime, MONTH) = '2018-04-01'
GROUP BY 1
ORDER BY c DESC
