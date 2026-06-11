/* Write your T-SQL query statement below */
select e.name 
from employee e
 where  id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5)