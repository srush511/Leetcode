/* Write your T-SQL query statement below */
with first_login as(

select player_id,min(event_date) as event_date from Activity
group by player_id
)


select round(count(distinct a1.player_id)*1.0/(select count(distinct player_id) from Activity),2 ) as fraction 
from
first_login a1
join Activity a2 on a1.player_id =a2.player_id
where datediff(day,a1.event_date,a2.event_date) = 1