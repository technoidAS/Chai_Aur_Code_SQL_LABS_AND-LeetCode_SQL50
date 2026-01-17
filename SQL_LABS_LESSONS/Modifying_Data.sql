--INSERT Single Row
insert into users (name, email, phone, age, country, city) 
values ('Test User', 'test@example.com', '555-9999', 30, 'USA', 'Austin');


--INSERT Multiple Rows
insert into categories (name, description) 
values ('Food', 'Food and beverages'), ('Automotive', 'Car parts and accessories');

--INSERT with Specific Columns
insert into users (name, email) values ('Jane Doe', 'jane@example.com');

--UPDATE Single Column
update products set stock = 75 where id = 1;

--UPDATE Multiple Columns
update users set age = 29, city = 'Boston' where id = 1;

--UPDATE with WHERE Condition

update products set price = price + 50 where category_id = 1;

--UPDATE with JOIN
update orders
set status = 'priority'
where user_id in (
    select id
    from users
    where country = 'USA'
);

--DELETE with WHERE
delete from orders where status = null;

--DELETE with JOIN
delete from reviews where user_id in (
  select id from users where country = 'Australia'
);

--INSERT INTO SELECT
insert into categories (name, description)
select distinct
    p.name as name,
    'Imported from products' as description
from products p
where not exists (
    select 1
    from categories c
    where c.name = p.name
);
