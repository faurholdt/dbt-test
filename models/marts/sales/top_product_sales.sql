/*
    Creating view of top sales by products
*/

{{ config(
    materialized='view',
    schema="publish"
) }}

with products as (
    select *
    from {{ ref("dim_products") }}
)

select 
  products.ProductCategory
, products.ProdcutSubcategory
, count(*) as UnitsSold
from {{ ref("stg_adventureworks_sales")}} as sales
inner join {{ ref("dim_products")}} as products on products.ProductKey =  sales.ProductKey
group by products.ProductCategory, products.ProdcutSubcategory
order by count(*) desc
limit 10