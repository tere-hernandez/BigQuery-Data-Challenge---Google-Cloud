-- The goal of this query is get the top github archives with more views per month in 2019 about python
SELECT repo.name, COUNT(DISTINCT actor.login)
FROM `githubarchive.month.2019*`
WHERE type = 'WatchEvent'
and lower(repo.name) like '%python%' 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 100;
