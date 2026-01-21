select 
round(avg(order_date = customer_pref_delivery_date) * 100, 2) as immediate_percentage 
from Delivery 
where (customer_id, order_date) in (
select customer_id, min(order_date) from Delivery group by customer_id
);


-- Solution With Common Table Expression (CTE)
-- with cte as(select *, row_number() over(partition by customer_id order by order_date) as rn, case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as type
-- from delivery)

-- select round(100*sum(type = 'immediate')/count(customer_id),2) as immediate_percentage
-- from cte
-- where rn = 1