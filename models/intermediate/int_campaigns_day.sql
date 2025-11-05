SELECT date_date,
COUNT(*) AS total_campaigns,
ROUND(SUM(ads_cost),2) AS total_cost,
ROUND(SUM(impression),2) AS total_impressions,
ROUND(SUM(click),2) AS total_clicks
FROM {{ref('int_campaigns')}}
GROUP BY date_date
ORDER BY date_date DESC