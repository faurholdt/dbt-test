/*
    Union all sales into one big table as they don't really serve any value being separated
*/
{{ config(
    materialized='table',
    schema="staging"
) }}

with sales_2015 as (
    select * from {{ source('ingest', 'adventureworks_sales_2015') }}
),

sales_2016 as (
    select * from {{ source('ingest', 'adventureworks_sales_2016') }}
),

sales_2017 as (
    select * from {{ source('ingest', 'adventureworks_sales_2017') }}
)


select *
from sales_2015
UNION ALL
select * from sales_2016
UNION ALL
select * from sales_2017