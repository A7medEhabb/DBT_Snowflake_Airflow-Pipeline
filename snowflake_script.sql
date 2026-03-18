// Create Data Warehouse
CREATE OR REPLACE WAREHOUSE finance_wh
WITH WAREHOUSE_SIZE= 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;

// Create Database
CREATE OR REPLACE DATABASE finance_db;
// Create Schema
CREATE OR REPLACE SCHEMA raw;

//Create Tables
CREATE OR REPLACE TABLE raw.customers (
    id INT primary key,
    name varchar,
    email varchar,
    countrry varchar
);

CREATE OR REPLACE TABLE raw.orders(
    id INT primary key,
    customer_id INT,
    order_date DATE,
    total_amount int,
    status varchar
);

CREATE OR REPLACE TABLE raw.order_items (
    id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price INT  
);

CREATE OR REPLACE TABLE raw.products (
    id INT primary KEY,
    name STRING,
    category STRING,
    price INT
);

// Product table stage
CREATE OR REPLACE STAGE finance_stage
FILE_FORMAT= (TYPE='CSV' SKIP_HEADER=1)

COPY INTO raw.products
FROM @finance_stage/products.csv
FILE_FORMAT= (TYPE='CSV' SKIP_HEADER=1)


//test
select * from raw.customers;
select * from raw.orders;
select * from raw.order_items;
select * from raw.products;


select lower(CURRENT_REGION()), lower(CURRENT_ACCOUNT())
select current_user()

CREATE USER dbt_user PASSWORD='dbt_password'
LOGIN_NAME='dbt_user'
DEFAULT_ROLE=ACCOUNTADMIN
MUST_CHANGE_PASSWORD=FALSE

GRANT ROLE ACCOUNTADMIN to user dbt_user;
GRANT USAGE ON DATABASE finance_db TO ROLE ACCOUNTADMIN
GRANT USAGE ON SCHEMA finance_db.raw TO ROLE ACCOUNTADMIN
GRANT USAGE ON WAREHOUSE finance_wh TO ROLE ACCOUNTADMIN

GRANT SELECT, INSERT, UPDATE , DELETE ON ALL TABLES IN SCHEMA finance_db.raw TO ROLE ACCOUNTADMIN

