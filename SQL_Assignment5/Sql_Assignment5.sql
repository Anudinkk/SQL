#Database
use sales;

#Country Table
select * from country;

#Person Table
select * from Persons;

#1. Write an SQL query to print the first three characters of Country_name from the Country table. 
select left(country_name,3) from country;

#2. Write an SQL query to concatenate first name and last name from Persons table. 
select concat(fname," ",lname) Fullname from Persons;

#3. Write an SQL query to count the number of unique country names from Persons table. 
select count(distinct country_name) 'Unique Countries' from Persons;

#4. Write a query to print the maximum population from the Country table. 
select max(population) from country;
 
#5. Write a query to print the minimum population from Persons table. 
select min(population) from persons;

#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
insert into persons(fname,lname,population,rating,country_id,country_name)
values('Virat',null,'10 lakhs',3.5,1,'France'),('Rohit',null,'21 lakhs',3.5,4,'UK');

select * from Persons;

select count(lname) count_of_lname from persons;

#7. Write a query to find the number of rows in the Persons table.
select count(*) from persons;
 
#8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select population from country limit 3;

#9. Write a query to print 3 random rows of countries. 
select * from country order by rand() limit 3;

#10. List all persons ordered by their rating in descending order. 
select * from persons order by rating desc;

#11. Find the total population for each country in the Persons table. 
select country_name,sum(population) Total_population from persons group by country_name;

#12. Find countries in the Persons table with a total population greater than 50  
select country_name,sum(population) from persons group by country_name having sum(population)>50;

#13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
 select count(*), country_name,avg(rating) from persons group by country_name having count(*) >= 2 order by avg(rating);
