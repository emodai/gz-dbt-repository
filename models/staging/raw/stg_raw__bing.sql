with 

source as (

    select * from {{ source('raw', 'bing') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name,
        ads_cost,
        impression,
        click,
        CONCAT(date_date, '-', campaign_key) AS unique_key

    from source

)

select * from renamed