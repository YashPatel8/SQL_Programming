
DROP DATABASE IF EXISTS `Sacramento`;
CREATE DATABASE  IF NOT EXISTS `Sacramento`;
USE `Sacramento`;

select * from Sacramento where beds >=2 and baths >=2; 

#697 listings

select * from Sacramento where type = 'Condo' order by sq__ft;

#2100

select zip,avg(price) as avg_price from Sacramento group by zip order by avg_price; 

#least expensive is 95648 - Lincoln CA near Sacramento

#most expensive is 95746 - Granite Bay, close to a like (property views) big golf course suggests wealthy residents

select city,min(baths) as min_baths, max(baths) as max_baths
from Sacramento
where beds = 2
group by city
having count(*) >=2;

