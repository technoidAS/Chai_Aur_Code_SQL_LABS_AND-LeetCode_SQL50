--Subquery in WHERE

select name, price from products where price > (
  select avg(price) from products
);

--Subquery in FROM

select count(*) from (
  select * from users where country = 'USA'
);

--EXISTS Operator

select name, email from users where exists (
  select 1 from orders where orders.user_id = users.id
);

--