/* Write your T-SQL query statement below */


select r.contest_id,round(
    count(r.user_id)*100.00/
    (select count(*) from users u)
    ,2) as percentage 
    from register r 
    group by r.contest_id
    order by percentage desc,contest_id


