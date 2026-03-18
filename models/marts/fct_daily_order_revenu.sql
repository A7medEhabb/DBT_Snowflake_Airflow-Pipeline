SELECT 
    o.order_date,
    o.order_id,
    sum(total_price) AS total_price
FROM
    {{ref('stg_orders')}} o 
LEFT JOIN 
    {{ref("stg_order_items")}} oi 
    ON o.order_id = oi.order_id
GROUP BY 1,2

