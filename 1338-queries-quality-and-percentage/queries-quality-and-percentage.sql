/* Write your T-SQL query statement below */
with query_quality as(
    select query_name,
    round(
        sum(
            cast(rating as decimal(5,2))/position)/count(query_name),2) as quality
                  from queries
    group by query_name
),

 poor_query_percent as(
    select query_name,
    round(count(iif(rating<3,1,null))*100.00/count(query_name),2) as poor_query_percentage
    from queries
    group by query_name
)

select qq.query_name,quality,poor_query_percentage from query_quality qq
join poor_query_percent pqp
on qq.query_name= pqp.query_name


