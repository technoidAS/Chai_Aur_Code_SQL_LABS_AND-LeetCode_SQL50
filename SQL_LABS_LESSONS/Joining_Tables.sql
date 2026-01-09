--Table Aliases
select 
    u.name, 
    u.email 
from users as u;

--INNER JOIN Basics

select 
    orders.id,
    users.name,
    orders.quantity
from orders
inner join users
    on orders.user_id = users.id;

--LEFT JOIN

select 
    p.name,
    r.rating 
from products p left join reviews r 
    on p.id = r.product_id;

--RIGHT JOIN

select 
    p.name,
    r.comment 
from reviews r right join products p 
    on p.id = r.product_id;

--Self JOIN

select 
    e1.name as employee_name,
    e2.name as manager_name 
from employees e1 join employees e2
    on e1.manager_id = e2.id;

--JOIN Multiple Tables

select 
    orders.id,
    users.name,
    products.name
from orders join users
    on orders.user_id = users.id
join products
    on orders.product_id = products.id;

--JOIN with WHERE

select 
    orders.id,
    users.name, 
    users.country 
from orders join users 
    on orders.user_id = users.id 
where users.country = 'USA';

