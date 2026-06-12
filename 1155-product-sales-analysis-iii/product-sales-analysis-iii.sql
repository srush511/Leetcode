/* Write your T-SQL query statement below */
with first_year as(
    select product_id, min(year) as first_year from sales
    group by product_id
)

select s.product_id,first_year,quantity,price from sales s
join first_year fy
on s.product_id = fy.product_id
    and s.year = fy.first_year
