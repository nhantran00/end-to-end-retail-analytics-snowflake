SELECT
    s.order_item_key,
    s.order_number,
    s.line_item,
    s.customer_key,
    s.product_key,
    s.store_key,
    TO_NUMBER(TO_CHAR(s.order_date, 'YYYYMMDD')) AS order_date_key,
    TO_NUMBER(TO_CHAR(s.delivery_date, 'YYYYMMDD')) AS delivery_date_key,
    s.current_code,
    s.quantity,
    p.unit_price_usd,
    p.unit_cost_usd,
    s.quantity * p.unit_price_usd AS sales_amount_usd,
    s.quantity * p.unit_cost_usd AS cost_amount_usd,
    (
        s.quantity * p.unit_price_usd
    ) - (
        s.quantity * p.unit_cost_usd
    ) AS profit_amount_usd,
    CASE
        WHEN s.delivery_date IS NOT NULL THEN 1
        ELSE 0
    END AS is_delivered,
    DATEDIFF(
        'day',
        s.order_date,
        s.delivery_date
    ) AS delivery_days

FROM {{ ref('stg_retail_line_items') }} s

LEFT JOIN {{ ref('stg_retail_products') }} p
    ON s.product_key = p.product_key