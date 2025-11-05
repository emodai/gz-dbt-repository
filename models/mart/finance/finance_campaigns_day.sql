SELECT 
date_date,
operational_margin - total_cost AS ads_margin,
average_basket,
operational_margin,
total_cost AS ads_cost,
total_impressions AS ads_impression,
total_clicks AS ads_click,
quantity,
revenue,
purchase_cost,
margin,
shipping_fee,
log_cost,
ship_cost
FROM {{ref("int_campaigns_day")}}
FULL OUTER JOIN {{ref("finance_days")}}
USING (date_date)
ORDER BY date_date DESC