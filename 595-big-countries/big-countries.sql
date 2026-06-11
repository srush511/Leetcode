/* Write your T-SQL query statement below */
select w.name, w.population, area from world w
where area>= 3000000 or w.population >=25000000