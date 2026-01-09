--WHERE Clause
select * from user where country = 'USA';

--Comparison Operators
select name, age from users where age > 35;

--WHERE with AND
select name, country, age from users where country = 'USA' and age < 32;

--WHERE with OR
select name and country from users where country = 'Canada' or country = 'UK';

--IN Operator
select name, country from  users where country in ('USA', 'Canada', 'UK');

--NOT IN Operator
select name, country from  users where country not in ('USA', 'Canada');

--BETWEEN Operator
select name, price from products where price between 20 and 100;

--LIKE Pattern Matching
select name, email from users where name like 'A%';

--IS NULL
select name, phone from users where phone is null;

--IS NOT NULL
select name, phone from users where phone is not null;