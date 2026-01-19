select 
q.query_name, round(avg(q.rating/q.position),2) as quality,
round(
    (
        (select count(rating) from Queries where rating < 3 and q.query_name = query_name) / count(q.rating)
    ) * 100, 2
) as poor_query_percentage 
from Queries q group by q.query_name;