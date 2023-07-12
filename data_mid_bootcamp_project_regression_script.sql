show variables like 'local_infile';
set global local_infile = 1;
show variables like "secure_file_priv";

    -- 1. create DB house_price_regression 
create database if not exists house_price_regression;

	-- 2. create table
drop table if exists house_price_data;
create table `house_price_data` (
  `id` bigint,
  `date` varchar(255),
  `bedrooms` int,
  `bathrooms` float,
  `sqft_living` int,
  `sqft_lot` int,
  `floors` float,
  `waterfront` int,
  `view` int,
  `condition` int,
  `grade` int,
  `sqft_above` int,
  `sqft_basement` int,
  `yr_built` int,
  `yr_renovated` int,
  `zipcode` int,
  `lat` float,
  `long` float,
  `sqft_living15` int,
  `sqft_lot15` int,
  `price` int
);

	-- 3. import data
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\regression_data.csv'
into table house_price_data
fields terminated by ',';

	-- 4. check data
select * from house_price_data;

	-- 5. drop date
alter table house_price_data
drop column `date`;

select * from house_price_data
limit 10;

	-- 6. number of rows
select count(*) from house_price_data;

	-- 7. unique values in some of the categorical columns
select distinct bedrooms from house_price_data;
select distinct bathrooms from house_price_data;
select distinct floors from house_price_data;
select distinct `condition` from house_price_data;
select distinct grade from house_price_data;

	-- 8. top 10 most expensive houses
select * from house_price_data
order by price desc
limit 10;

	-- 9. average price of all the properties
select avg(price) from house_price_data;

	-- 10a. average price of the houses grouped by bedrooms
select bedrooms, avg(price) 'avg price by bedrooms' from house_price_data
group by bedrooms
order by bedrooms;

	-- 10b. average sqft_living of the houses grouped by bedrooms
select bedrooms, avg(sqft_living) 'avg sqft_living by bedrooms' from house_price_data
group by bedrooms
order by bedrooms;

	-- 10c. average price of the houses with/without a waterfront
select waterfront, avg(price) 'avg price by waterfront' from house_price_data
group by waterfront;

	-- 10d. condition 1 and 2 show a slighty lower average grade, showing that the condition plays a certain role in the grading of the houses but may not be one the most important factors.
select `condition`, avg(grade) 'avg grade by condition' from house_price_data
group by `condition`
order by `condition`;

	-- 10d. evenly distributed average condition by every grade except for the lowest value of grade, which shows a higher avg condition. Possibly due to a lower sample size of grade 3 rows.
select grade, avg(`condition`) 'avg condition by grade' from house_price_data
group by grade
order by grade;

	-- 11. No options available for this customer if we restrict number of bedrooms to 3 and 4
select * from house_price_data
where bedrooms in (3,4)
and bathrooms > 3
and floors = 1
and waterfront = 0
and `condition` >= 3
and grade >= 5
and price < 300000;

	-- 11a. 3 options '7316400070', '5379801972' and '822059038' with 5 and 6 bedrooms that meet all other criteria
select * from house_price_data
where bedrooms >= 3
and bathrooms > 3
and floors = 1
and waterfront = 0
and `condition` >= 3
and grade >= 5
and price < 300000;

	-- 12. list of properties whose prices are twice more than the average
select * from house_price_data
where price >= 2*(select avg(price) from house_price_data)
order by price;

	-- 13. create view
create view twice_average_price as
select * from house_price_data
where price >= 2*(select avg(price) from house_price_data)
order by price;

select * from twice_average_price;

	-- 14. difference in average prices of the properties with three and four bedrooms
select sum(case when bedrooms = 3 then avg_price end)avg_price_3beds,
sum(case when bedrooms = 4 then avg_price end) avg_price_4beds,
(sum(case when bedrooms = 4 then avg_price end) - sum(case when bedrooms = 3 then avg_price end)) as difference_avg_price
from (
select bedrooms, avg(price) avg_price from house_price_data
where bedrooms in (3,4)
group by bedrooms) as sq;

	-- 15. distinct zip codes
select distinct zipcode from house_price_data;

	-- 16. list of all renovated properties
select * from house_price_data
where yr_renovated <> 0;

	-- 17. details of 11th most expensive property
select * from house_price_data
order by price desc
limit 10, 1;




