select
    customer_key,
    gender,
    name,
    city,
    "State Code" as state_code,
    state,
    "Zip Code" as zip_code,
    country,
    continent,
    birthday
from 
    {{ source('raw', 'customers') }}