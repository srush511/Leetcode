select s.user_id
,round(cast(count(iif( c.action = 'confirmed' , 1 ,null)) as float)
/ count(s.user_id), 2) as confirmation_rate
from Signups as s
left join Confirmations as c
on s.user_id = c.user_id
group by s.user_id;



