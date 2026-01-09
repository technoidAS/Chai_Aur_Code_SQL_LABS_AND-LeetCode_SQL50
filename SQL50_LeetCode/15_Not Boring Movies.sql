select * from Cinema c
where mod(id, 2) = 1 and description != 'boring'
order by rating desc;