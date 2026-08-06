select
    s.order_item_key,
    s.order_number,
    s.line_item,
    s.customer_key,
    s.product_key,
    s.store_key,
    TO_NUMBER(TO_CHAR(s.order_date,'YYYYMMDD')) AS order_date_key,
    TO_NUMBER(TO_CHAR(s.delivery_date,'YYYYMMDD')) AS delivery_date_key,
    s.quantity,
    p.unit_price_usd,
    s.quantity * p.unit_price_usd AS sales_amount_usd,

    DATEDIFF(
        day,
        s.order_date,
        s.delivery_date
    ) AS delivery_days,

    s.current_code
from
    {{ ref('stg_retail_line_items') }} s

left join {{ ref('dim_retail_products') }} p
on s.product_key = p.product_key