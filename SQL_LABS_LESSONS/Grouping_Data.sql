--COUNT Function
select count(*) from orders;

--SUM Function
select sum(stock) from products;

--AVG Function
select avg(salary) from users;

--MIN and MAX Functions
select min(price), max(price) from products;

--GROUP BY
select country, count(*) from users group by country;

--HAVING Clause
select country, count(*) from users group by country having count(*) > 3;
