/* Write your T-SQL query statement below */
select p.project_id,
round (
    avg (
        cast(
            e.experience_years as decimal(5,2)
            )),2
            ) as average_years
 from project p
join employee e
on p.employee_id =e.employee_id
group by project_id
