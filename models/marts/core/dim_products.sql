/*
    Creating dimension from the three product tables - Mostly in order to get away from the snowflake schema
*/

{{ config(
    materialized='table',
    schema="publish"
) }}

with product_categories as (
    select * 
    from {{ ref("stg_adventureworks_product_subcategories") }} as subcats
    inner join {{ ref("stg_adventureworks_product_categories") }} as cats on subcats.ProductCategoryKey = cats.ProductCategoryKey

)

select
  products.ProductKey
, products.ProductSKU
, products.ProductName
, products.ModelName
, products.ProductDescription
, products.ProductColor
, products.ProductSize
, products.ProductStyle
, products.ProductCost
, products.ProductPrice
, cats.CategoryName as ProductCategory
, cats.SubcategoryName as ProdcutSubcategory
from {{ ref("stg_adventureworks_products") }} as products
inner join product_categories as cats on products.ProductSubcategoryKey = cats.ProductSubcategoryKey