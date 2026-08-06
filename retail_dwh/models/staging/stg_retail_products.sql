select 
    product_key,
    product_name,
    brand,
    color,
    {{ clean_currency('unit_price_usd') }} AS unit_price_usd,
    {{ clean_currency('unit_cost_usd') }} AS unit_cost_usd,
    subcategory_key,
    subcategory,
    category_key,
    category
from 
    {{ source('raw', 'products') }}