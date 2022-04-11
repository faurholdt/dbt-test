{{ config(
    materialized='table',
    schema="staging"
) }}


select *
from {{ source('ingest', 'adventureworks_product_subcategories') }}