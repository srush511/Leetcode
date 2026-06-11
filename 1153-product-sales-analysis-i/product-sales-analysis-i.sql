/* Write your T-SQL query statement below */
select product_name, year,price from sales S
left join product p on
S.product_id = p.product_id