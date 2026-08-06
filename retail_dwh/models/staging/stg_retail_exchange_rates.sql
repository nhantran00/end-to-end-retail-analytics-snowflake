SELECT
    "date" AS exchange_date,
    currency,
    "exchange" AS exchange_rate
FROM {{ source('raw', 'exchange_rates') }}