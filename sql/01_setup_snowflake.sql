use role accountadmin;

create warehouse if not exists retail_wh 
    with warehouse_size = 'X-Small' 
    auto_suspend = 60
    auto_resume = TRUE;

create database if not exists retail_db;

create schema if not exists retail_db.raw;
create schema if not exists retail_db.staging;
create schema if not exists retail_db.mart;

create role if not exists dbt_role;

show grants on warehouse retail_wh;

grant usage on warehouse retail_wh to role dbt_role;

grant role dbt_role to user nhantran1104;

grant all privileges on database retail_db to role dbt_role;

grant usage on schema retail_db.raw to role dbt_role;
grant select on all tables in schema retail_db.raw to role dbt_role;
grant select on future tables in schema retail_db.raw to role dbt_role;

grant usage, create view on schema retail_db.staging to role dbt_role;
grant usage, create table, create view on schema retail_db.mart to role dbt_role;