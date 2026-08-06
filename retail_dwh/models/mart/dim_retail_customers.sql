select
    customer_key,
    gender,
    name,
    city,
    state_code,
    state,
    zip_code,
    country,
    continent,
    birthday
from 
    {{ ref('stg_retail_customers') }}