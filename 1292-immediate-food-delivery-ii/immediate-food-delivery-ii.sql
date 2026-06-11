with first_orders as (
    select customer_id, min(order_date) as first_order_date 
    from Delivery
    group by customer_id
)

select round(sum(case when d.order_date =d.customer_pref_delivery_date then 1 else 0 end) * 100.00/count(*),2) as immediate_percentage
from Delivery d
join first_orders f
on d.customer_id = f.customer_id and d.order_date =f.first_order_date

/*
WITH RankedDelivery AS (
    SELECT 
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS row_num
    FROM 
        Delivery
)
SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS immediate_percentage
FROM 
    RankedDelivery
WHERE 
    row_num = 1;

*/