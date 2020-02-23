/*
SQL STATEMENTS:
select
from
where
group by
having

Functions:
sum()
count()
min()
max()
avg()
*/


/*
1)
columns are street city zip state	beds baths sq__ft type sale_date price latitude	longitude

2)
street: varchar(100) text
city varchar(50) text
zip char(5) or numeric but char is better text
state char(2) text
beds int
baths int
sq_ft int
type varchar(50) text
sale_date varchar(250) text
price int
latitude float or double (float is most expansive for all cases)
longtitude float or double


3) Yes, but other versions of SQL (SQL Server, T-SQL) allow for more descriptive variable types than MySQL

4)
*/
use aly;
select * from sacramento where beds >=2 and baths >=2; 
#697 listings

#5)

select * from sacramento where type = 'Condo' order by sq__ft;
#2100

#6
select zip,avg(price) as avg_price from sacramento group by zip order by avg_price; 

#7
#least expensive is 95648 - Lincoln CA near Sacramento

#most expensive is 95746 - Granite Bay, close to a like (property views) big golf course suggests wealthy residents

#8
select city,min(baths) as min_baths, max(baths) as max_baths
from sacramento
where beds = 2
group by city
having count(*) >=2;


