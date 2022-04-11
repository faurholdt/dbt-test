{{ config(
    materialized='table',
    schema="staging"
) }}


select Date
from {{ source('ingest', 'adventureworks_calendar') }}