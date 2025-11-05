SELECT date_date AS campaign_date,
COUNT(*) AS total_campaigns,
SUM(ads_cost) AS total_spend,
SUM(impression) AS total_impressions,
SUM(click) AS total_clicks,
MAX(campaign_name) AS campaign_name
FROM {{ref('int_campaigns')}}
GROUP BY campaign_date
ORDER BY date_date DESC