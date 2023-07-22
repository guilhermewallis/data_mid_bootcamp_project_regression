-- Create a database called house_price_regression.
create database house_price_regression;

use house_price_regression;
-- 2. Create a table house_price_data with the same columns as given in the csv file.
drop table if exists house_price_data;

create table house_price_data (
	id varchar(30),
	`date` varchar(15),
    bedrooms int,
    bathrooms float,
    sqft_living int,
    sqft_lot int,
    floors float,
    waterfront int,
    `view` int,
    `condition` int,
    grade int,
    sqft_above int,
    sqft_basement int,
    yr_built int,
    yr_renovated int,
    zipcode int,
    lat float,
    `long` float,
    sqft_living15 int,
    sqft_lot15 int,
    price int
    );
    
-- 3. Import the data from the csv file into the table.
-- 4. Select all the data from table house_price_data to check if the data was imported correctly
select * from house_price_data;

-- 5. Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
alter table house_price_data
drop date;
select * from house_price_data
limit 10;

-- 6. Use sql query to find how many rows of data you have.
select count(*)
from house_price_data;

-- 7. Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column bedrooms?
select distinct bedrooms from house_price_data;

-- What are the unique values in the column bathrooms?
select distinct bathrooms 
from house_price_data;

-- What are the unique values in the column floors?
select distinct floors 
from house_price_data;

-- What are the unique values in the column condition?
select distinct `condition` 
from house_price_data;

-- What are the unique values in the column grade?
select distinct `grade` 
from house_price_data;

-- 8. Arrange the data in a decreasing order by the price of the house. Return only the IDs of the top 10 most expensive houses in your data.
select id, price from house_price_data
order by price desc
limit 10;

-- 9. What is the average price of all the properties in your data?
select avg(price) from house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
-- What is the average price of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the prices. Use an alias to change the name of the second column.
select distinct bedrooms, round(avg(price),0) as AvgPrice from house_price_data
group by bedrooms
order by bedrooms asc;

-- What is the average sqft_living of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.
select distinct bedrooms, round(avg(sqft_living),0) as avgSqftLiving from house_price_data
group by bedrooms
order by bedrooms asc;

-- What is the average price of the houses with a waterfront and without a waterfront? 
-- The returned result should have only two columns, waterfront and Average of the prices. Use an alias to change the name of the second column.
select distinct waterfront, round(avg(price),0) as avg_price from house_price_data
group by waterfront
order by waterfront asc;

-- Is there any correlation between the columns condition and grade?  You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select grade, avg(`condition`) as avg_condition from house_price_data 
group by grade
order by grade asc; 

select `condition`, avg(grade) as avg_grade from house_price_data 
group by `condition`
order by `condition` asc; 
-- there is no clear correlation for grades since they all (except grade 3) have an average condition around 3. For the houses with a condition above 3, avg grade is above 7. 

-- 11. One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
-- Bathrooms more than 3
-- One Floor
-- No waterfront
-- Condition should be 3 at least
-- Grade should be 5 at least
-- Price less than 300000

select id, bedrooms, bathrooms, floors, waterfront, `condition`, grade, price from house_price_data 
where bedrooms in (3,4)
and bathrooms > 3 
and floors = 1 
and waterfront = 0
and `condition` >= 3
and grade > 4
and price < 300000;

-- 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
-- Write a query to show them the list of such properties. You might need to use a sub query for this problem.
select id, price from house_price_data
where price > (
	select avg(price) * 2 from house_price_data);

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
create view houses_price_above_double_avg as 
select id, price from house_price_data
where price > (
	select avg(price) * 2 from house_price_data);
    
-- 14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?
select (
select round(avg(price),2) from house_price_data
where bedrooms = 4
)-(
select round(avg(price),2) from house_price_data
where bedrooms = 3) as price_diff;

-- 15. What are the different locations where properties are available in your database? (distinct zip codes)

select distinct zipcode as locations
from house_price_data;

-- 16. Show the list of all the properties that were renovated
select id, yr_renovated from house_price_data
where yr_renovated > 0;

-- 17. Provide the details of the property that is the 11th most expensive property in your database.
select * from house_price_data
order by price desc
limit 1 offset 10;







