--Basic CTE with WITH

-- CTE (Common Table Expression) using WITH clause
-- Creates a temporary named result set that exists only for the duration of the query
-- Makes complex queries more readable and maintainable

-- Task: Create a CTE named "usa_users" that selects all users from USA
-- then select name and city from this CTE

with usa_users as(
  select * from users where country = 'USA'
) 
select name, city from usa_users;

--Multiple CTEs

-- You can define multiple CTEs separated by commas
-- Later CTEs can reference earlier ones, building complex queries step by step

-- Task: Create two CTEs:
-- 1. "high_price" - products with price > 100
-- 2. "electronics" - products in category_id=1
-- Then select names from products that are in BOTH CTEs (intersection)

with high_price as (
  select * from products where price > 100
),
electronics as(
  select * from products where category_id = 1
)
select high_price.name from high_price inner join electronics on high_price.id = electronics.id;

-- Alternative approach using "INTERSECT":
with high_price as (
    select id, name from products where price > 100
),
electronics as (
    select id, name from products where category_id = 1
)
select name from high_price
intersect
select name from electronics;


--CTE for Complex Aggregation

-- CTEs are perfect for multi-step aggregations
-- First aggregate data, then filter or join the results
-- Much cleaner than nested subqueries

-- Task: Create a CTE "order_totals" that calculates total quantity per user
-- Then select user name and total_quantity for users with more than 2 total items ordered

with order_totals as (
    select 
        user_id,
        SUM(quantity) as total_quantity
    from orders
    group by user_id
)
select 
    u.name,
    ot.total_quantity
from order_totals ot
inner join users u on ot.user_id = u.id
where ot.total_quantity > 2
order by ot.total_quantity desc;

-- Why use CTEs for aggregation:
-- 1. Readability: The aggregation logic is clearly separated
-- 2. Maintainability: Easy to modify the aggregation without rewriting the main query
-- 3. Clarity: The CTE name "order_totals" documents what the data represents
-- 4. Reusability: Can reference the same CTE multiple times if needed

--Alternatively we can also do this :
with order_totals as (
  select 
  u.name as name,
  sum(o.quantity) as total_quantity
  from orders o left join users u on o.user_id = u.id group by u.id
) 
select * from order_totals
where total_quantity > 2;

--Recursive CTE

-- Recursive CTEs traverse hierarchical data (trees, org charts, etc.)
-- Two parts: BASE CASE (starting point) + RECURSIVE CASE (how to continue) + UNION ALL

-- Task: Find all employees and their reporting chain
-- Start with employee id=1 (top manager) and recursively find all who report to them
-- Select employee id and name

-- Write your SQL query here

WITH RECURSIVE employee_hierarchy AS (
    -- BASE CASE: Start with the top manager (employee_id = 1)
    SELECT 
        id,
        name,
        manager_id,
        1 AS level
    FROM employees
    WHERE id = 1
    
    UNION ALL
    
    -- RECURSIVE CASE: Find employees who report to the current level
    SELECT 
        e.id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.id
    WHERE eh.level < 10  -- Prevent infinite recursion with depth limit
)
SELECT 
    id,
    REPEAT('', level - 1) || name AS name
FROM employee_hierarchy
ORDER BY level, id;

-- How Recursive CTEs work:
-- 1. BASE CASE: Runs first, returns initial rows (employee id=1)
-- 2. RECURSIVE CASE: References the CTE itself (eh) and joins with the base table (employees)
-- 3. UNION ALL: Combines results from each iteration
-- 4. Termination: Stops when the recursive query returns no new rows
-- 5. Level tracking: Helps visualize depth and prevent infinite loops
