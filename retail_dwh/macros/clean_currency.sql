{% macro clean_currency(column_name) %}

TRY_TO_DECIMAL(
    REPLACE(
        REPLACE(TRIM({{ column_name }}), '$', ''),
        ',',
        ''
    ),
    10,
    2
)

{% endmacro %}