
use sales;



#Create a table named country
create table Country(
id int primary key auto_increment,
country_name varchar(20),
population varchar(20),
area varchar(20)
);

desc Country;



#Create a table named persons
create table Persons(
id int primary key auto_increment,
fname varchar(20),
lname varchar(20),
population varchar(20),
rating float,
country_id int,
country_name varchar(20),
foreign key(country_id) references Country(id)
);

desc Persons;


#Insert values into Country table
INSERT INTO Country (country_name, population, area)
VALUES
('France', '10 lakh', '9.8 million km²'),
('India', '140 lakh', '3.3 million km²'),
('China', '135 lakh', '9.6 million km²'),
('UK', '21 lakh', '8.5 million km²'),
('Russia', '16 lakh', '17.1 million km²'),
('Canada', '38 lakh', '9.98 million km²'),
('Australia', '26 lakh', '7.7 million km²'),
('Germany', '83 lakh', '357,022 km²'),
('Japan', '23 lakh', '377,975 km²'),
('USA', '60 lakh', '1.22 million km²');

select * from Country;



#Insert values into Persons table
INSERT INTO Persons (fname, lname, population, rating, country_id, country_name)
VALUES
('Alice', 'Johnson', '10 lakh', 4.5, 1, 'France'),
('Bob', 'Smith', '140 lakh', 3.9, 2, 'India'),
('Charlie', 'Brown', '135 lakh', 4.7, 3, ''),
('Diana', 'Prince', '21 lakh', 4.2, 4, 'UK'),
('Ethan', 'Hunt', '16 lakh', 3.8, 5, 'Russia'),
('Fiona', 'Taylor', '38 lakh', 4.6, 6, 'Canada'),
('George', 'Williams', '26 lakh', 4.1, 7, 'Australia'),
('Hannah', 'Davis', '83 lakh', 4.3, 8, 'Germany'),
('Ian', 'Clark', '23 lakh', 4.8, 9, 'Japan'),
('Jessica', 'Lee', '60 lakh', 4.4, 10, 'USA');

select * from Persons;


#Display distinct country name from persons table
select distinct(country_name) from Persons;


#Display first names and last names from the Persons table with aliases.
select fname 'first name',lname 'last name' from Persons;


#Display all persons with a rating greater than 4.0.
select * from Persons where rating>4.0;


#Display countries with a population greater than 10 lakhs. 
select country_name from Country where population > '10 lakhs';


#Display persons who are from 'USA' or have a rating greater than 4.5.
select * from Persons where country_name='USA' or rating>4.5;


#Find all persons where the country name is NULL. 
select * from persons where country_name='';


#Find all persons from the countries 'USA', 'Canada', and 'UK'.
select * from persons where country_name in ('USA','Canada','UK');


#Find all persons not from the countries 'India' and 'Australia'.
select * from persons where country_name not in ('India','Australia');


#Find all countries with a population between 5 lakhs and 20 lakhs.
select * from country where population between 5 and 20 ;

#Find all countries whose names do not start with 'C'.
select country_name from country where country_name not like 'c%';








