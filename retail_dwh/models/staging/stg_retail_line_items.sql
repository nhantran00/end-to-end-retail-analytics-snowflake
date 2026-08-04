select
    {{
        dbt_utils.generate_surrogate_key([
            'order_number',
            'line_item'
        ])
    }} as order_item_key,
    order_number,
    line_item,
    order_date,
    delivery_date,
    customer_key,
    store_key,
    product_key,
    quantity,
    current_code
from 
    {{ source('raw', 'sales') }}