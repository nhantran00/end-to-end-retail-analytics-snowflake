SELECT
    s.order_item_key,
    s.order_number,
    s.line_item,
    s.customer_key,
    s.product_key,
    s.store_key,
    TO_NUMBER(TO_CHAR(s.order_date, 'YYYYMMDD')) AS order_date_key,
    TO_NUMBER(TO_CHAR(s.delivery_date, 'YYYYMMDD')) AS delivery_date_key,
    CASE
        WHEN s.store_key = 0 THEN 'Online'
        ELSE 'In-store'
    END AS sales_channel,

    s.current_code,
    s.quantity,
    p.unit_price_usd,
    p.unit_cost_usd,
    s.quantity * p.unit_price_usd AS sales_amount_usd,
    s.quantity * p.unit_cost_usd AS cost_amount_usd,
    (s.quantity * p.unit_price_usd) - (s.quantity * p.unit_cost_usd) AS profit_amount_usd,

    CASE
        WHEN s.store_key = 0 AND s.delivery_date IS NOT NULL
        THEN DATEDIFF(
            'day',
            s.order_date,
            s.delivery_date
        )
        ELSE NULL
    END AS delivery_days

FROM {{ ref('stg_retail_line_items') }} s
LEFT JOIN {{ ref('stg_retail_products') }} p
    ON s.product_key = p.product_key