{{ config(
    materialized='table',
    schema="staging"
) }}


select distinct Date as date
from {{ source('ingest', 'adventureworks_calendar') }}