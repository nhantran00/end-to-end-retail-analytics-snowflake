SELECT
    s.order_item_key,
    s.order_number,
    s.line_item,
    s.customer_key,
    s.product_key,
    s.store_key,
    TO_NUMBER(TO_CHAR(s.order_date, 'YYYYMMDD')) AS order_date_key,
    TO_NUMBER(TO_CHAR(s.delivery_date, 'YYYYMMDD')) AS delivery_date_key,
    s.quantity,
    s.unit_price_usd,
    s.quantity * s.unit_price_usd AS sales_amount_usd,
    s.currency_code
FROM {{ ref('stg_retail_line_items') }} 