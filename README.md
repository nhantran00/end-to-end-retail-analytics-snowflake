# End-to-end Retail Analytics on Snowflake

## Project Overview

This project demonstrates an end-to-end retail analytics data pipeline built using Snowflake, dbt, and Apache Airflow. The pipeline transforms raw retail data into a structured data warehouse using a Raw → Staging → Mart architecture, delivering analytics-ready data for business reporting and decision-making.

## Dataset

This project uses the *Global Electronics Retail Dataset* from *Maven Analytics*. The dataset represents a fictional global electronics retailer and includes information about sales transactions, products, customers, stores, and currency exchange rates.

## Business Requirements

1. Analyze the types of products sold and the geographic distribution of customers.
2. Identify seasonal patterns and trends in order volume and revenue.
3. Evaluate average delivery time and monitor changes in delivery performance over time.
4. Compare the Average Order Value (AOV) between online and in-store sales channels.

## Architecture

[image]

| Component | Responsibility | Why This Tool? |
|-----------|----------------|----------------|
| Snowflake | Cloud Data Warehouse | Designed for OLAP workloads with independent compute and storage, making it suitable for scalable analytics. |
| dbt | Data Transformation | Enables modular SQL transformations, test, documentation, and lineage. |
| Apache Airflow | Workflow Orchestration | Automates pipeline execution, scheduling tasks.

## Workflow
1. Initialize the Snowflake environment by creating the warehouse, database, schemas.
![alt text](images//image.png)

2. Upload CSV files to Snowflake Stage and load raw data into the Raw schema using COPY INTO.
![alt text](images/image-1.png)
![alt text](images/image-3.png)
![alt text](images/image-2.png)

3. Use dbt to clean, standardize, and validate raw data in the Staging layer.

4. Build dimensional models following a Star Schema in the Mart layer.

5. Automate the ELT pipeline using Apache Airflow.

## Results