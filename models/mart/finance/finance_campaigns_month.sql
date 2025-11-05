-- models/mart/finance/finance_campaigns_month.sql

WITH monthly_aggregation AS (
    SELECT
        FORMAT_DATE('%Y-%m', date_date) AS datemonth,
        -- Aggregate ad margin as sum of daily margins
        SUM(ads_margin) AS ads_margin,
        -- Aggregate other metrics
        ROUND(AVG(average_basket),2) AS average_basket,
        ROUND(AVG(operational_margin),2) AS avg_operational_margin,
        SUM(ads_cost) AS ads_cost,
        SUM(ads_impression) AS ads_impression,
        SUM(ads_click) AS ads_clicks,
        SUM(quantity) AS quantity,
        SUM(revenue) AS revenue,
        SUM(purchase_cost) AS purchase_cost,
        ROUND(AVG(margin),2) AS avg_margin,
        SUM(shipping_fee) AS shipping_fee,
        SUM(log_cost) AS log_cost,
        SUM(ship_cost) AS ship_cost
    FROM {{ ref('finance_campaigns_day') }}
    GROUP BY datemonth
)

SELECT
    datemonth,
    ads_margin,
    average_basket,
    avg_operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    avg_margin,
    shipping_fee,
    log_cost,
    ship_cost
FROM monthly_aggregation
