select 
    store_key,
    country,
    state,
    square_meters,
    open_date
from    
    {{ ref('stg_retail_stores') }}