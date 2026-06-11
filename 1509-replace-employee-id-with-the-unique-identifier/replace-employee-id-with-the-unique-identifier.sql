/* Write your T-SQL query statement below */
select unique_id, name from employeeuni eu 
right join employees e on
eu.id =e.id