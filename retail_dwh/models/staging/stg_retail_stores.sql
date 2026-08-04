select 
    store_key,
    country,
    state,
    square_meters,
    open_date
from 
    {{ source('raw', 'stores') }}