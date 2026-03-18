SELECT
    id AS customer_id,
    name AS customer_name,
    email,
    countrry AS country
FROM {{source('raw_data', 'customers')}}