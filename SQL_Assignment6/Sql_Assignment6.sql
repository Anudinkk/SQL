use sales;
select * from persons;
#(1)Perform inner join, Left join, and Right join on the tables. 

-- inner join
select p.fname, p.lname, c.country_name from persons p inner join country c on p.country_id = c.id;

-- left join
select c.country_name, p.fname, p.lname  from  country c left join  persons p on p.country_name = c.country_name;

-- right join
select c.country_name, p.fname, p.lname  from  country c right join  persons p on p.country_name = c.country_name;


#(2)List all distinct country names from both the Country and Persons tables. 
select distinct c.country_name from country c inner join persons p on p.country_name=c.country_name;

#(3)List all country names from both the Country and Persons tables, including duplicates.
select c.country_name from country c inner join persons p on p.country_name=c.country_name;
 
#(4)Round the ratings of all persons to the nearest integer in the Persons table.
select round(rating) from persons;