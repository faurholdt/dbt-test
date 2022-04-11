{{ config(
    materialized='table',
    schema="staging"
) }}


select *
from {{ source('ingest', 'adventureworks_returns') }}