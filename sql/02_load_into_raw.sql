use database retail_db;
use schema raw;

create stage if not exists raw.my_stage;

show stages;

list @my_stage;

create or replace file format raw.csv_format
type = csv
skip_header = 1
field_optionally_enclosed_by = '"'
null_if = ('', 'NULL');

create or replace table raw.customers (
    customer_key number,
    gender varchar(20),
    name varchar(200),
    city varchar(100),
    "State Code" varchar(50),
    state varchar(100),
    "Zip Code" varchar(20),
    country varchar(100),
    continent varchar(100),
    birthday date
);

copy into raw.customers
from @raw.my_stage/Customers.csv
file_format = raw.csv_format;

create or replace table raw.sales (
    order_number number,
    line_item number,
    order_date date,
    delivery_date date,
    customer_key number,
    store_key number,
    product_key number,
    quantity number,
    current_code VARCHAR(10)
);

copy into raw.sales
from @raw.my_stage/Sales.csv
file_format = raw.csv_format;

create or replace table raw.stores (
    store_key number,
    country varchar(30),
    state varchar(50),
    square_meters number,
    open_date date
);

copy into raw.stores
from @raw.my_stage/Stores.csv
file_format = raw.csv_format;

create or replace table raw.products (
    product_key number,
    product_name varchar(200),
    brand varchar(100),
    color varchar(30),
    unit_cost_usd varchar,
    unit_price_usd varchar,
    subcategory_key number,
    subcategory varchar(100),
    category_key number,
    category varchar(100)
);

copy into raw.products
from @raw.my_stage/Products.csv
file_format = csv_format;

create or replace table raw.exchange_rates (
    "date" date,
    currency varchar(10),
    "exchange" number(10, 6)
);

copy into raw.exchange_rates
from @raw.my_stage/Exchange_Rates.csv
file_format = csv_format;