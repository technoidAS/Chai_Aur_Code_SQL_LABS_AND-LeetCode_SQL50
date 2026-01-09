--Select all columns
select * from users;

--SELECT Specific Columns
select name, email from users;

--SELECT with DISTINCT
select distinct country from users;

--LIMIT Results
select * from users limit 5;

--Column Aliases with AS
select name as customer_name, country as location from users;
