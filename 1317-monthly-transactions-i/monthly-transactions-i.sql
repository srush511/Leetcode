/* Write your T-SQL query statement below */




    select FORMAT(trans_date,'yyyy-MM') AS month, country,
    count(id) as trans_count,
    count(iif(state ='approved',1,null)) as approved_count,    
    sum(amount) as trans_total_amount,
    sum(IIF(state = 'approved', amount, 0)) as approved_total_amount
     from Transactions
    group by FORMAT(trans_date,'yyyy-MM'),country

