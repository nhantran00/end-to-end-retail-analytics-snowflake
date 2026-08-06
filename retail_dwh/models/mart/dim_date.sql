WITH date_spine AS (
    SELECT
        DATEADD(
            DAY,
            ROW_NUMBER() OVER (ORDER BY seq4()) - 1,
            '2015-01-01'
        ) AS calendar_date

    FROM TABLE(GENERATOR(ROWCOUNT => 5000))
)

SELECT
    TO_NUMBER(TO_CHAR(calendar_date, 'YYYYMMDD')) AS date_key,

    calendar_date AS date,

    YEAR(calendar_date) AS year,

    QUARTER(calendar_date) AS quarter,

    MONTH(calendar_date) AS month,

    MONTHNAME(calendar_date) AS month_name,

    WEEK(calendar_date) AS week,

    DAY(calendar_date) AS day,

    DAYNAME(calendar_date) AS day_name

FROM date_spine

WHERE calendar_date <= '2023-12-31'