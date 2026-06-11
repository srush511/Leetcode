/* Write your T-SQL query statement below */


with approved_amount as(
    select FORMAT(trans_date, 'yyyy-MM') AS month,country,count(iif(state ='approved',1,null)) as approved_count, sum(IIF(state = 'approved', amount, 0)) as approved_total_amount from Transactions     
    group by FORMAT(trans_date,'yyyy-MM'),country
),

transaction_count as(
    select FORMAT(trans_date,'yyyy-MM') AS month, country,count(id) as trans_count,sum(amount) as trans_total_amount from Transactions
    group by FORMAT(trans_date,'yyyy-MM'),country
)


select aa.month,aa.country,tc.trans_count,aa.approved_count,
tc.trans_total_amount,aa.approved_total_amount
from approved_amount aa
join transaction_count tc
on aa.month = tc.month and  ISNULL(aa.country, '') = ISNULL(tc.country, '')


