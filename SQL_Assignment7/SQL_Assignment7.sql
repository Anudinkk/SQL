use sales;

select * from Persons;
select * from country;

 #1. Find the number of persons in each country. 
 select country_name,count(*) persons_count from Persons group by country_name;
 
 #2. Find the number of persons in each country sorted from high to low. 
select country_name,count(*) persons_count from Persons group by country_name order by count(*) desc;

 #3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
 select country_name, avg(rating) from persons group by country_name having avg(rating) > 3.0;
 
 #4. Find the countries with the same rating as the USA.
 select country_name,rating from persons where rating=(select rating from persons where country_name='USA');
 
 #5. Select all countries whose population is greater than the average population of all nations. 
 select country_name,population from country where population > (select avg(population) from country);
 
 #Create a database named Product
 CREATE DATABASE Product;
 
 USE Product;
 
 #create a table called Customer
 CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone_no VARCHAR(15) NOT NULL,
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50) NOT NULL
);
 
 desc Customer;
 
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
VALUES
('Akhil', 'Nair', 'akhil.nair@example.com', '9876543210', '123 MG Road', 'Kochi', 'Kerala', '682001', 'India'),
('Deepa', 'Menon', 'deepa.menon@example.com', '9876543222', '456 Gandhi Nagar', 'Thiruvananthapuram', 'Kerala', '695001', 'India'),
('Rahul', 'Pillai', 'rahul.pillai@example.com', '9876543233', '789 Marine Drive', 'Kozhikode', 'Kerala', '673001', 'India'),
('Sneha', 'Warrier', 'sneha.warrier@example.com', '9876543244', '159 Kaloor', 'Ernakulam', 'Kerala', '682017', 'India'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5556667777', '789 Oak St', 'Chicago', 'illions', '60601', 'USA'),
('Bob', 'Brown', 'bob.brown@example.com', '3332221111', '159 Pine St', 'Houston', 'California', '77001', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '7778889999', '753 Birch St', 'Miami', 'Florida', '33101', 'USA'),
('Vishnu', 'Krishnan', 'vishnu.krishnan@example.com', '9876543255', '753 Vyttila', 'Thrissur', 'Kerala', '680001', 'India');



select * from customer;
 
#Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
create view customer_info as select concat(First_name," ", Last_name) Fullname,Email from customer;
select * from customer_info;

#Create a view named US_Customers that displays customers located in the US. 
create view US_Customers as select * from customer where country='USA';
select * from US_Customers;

#Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
create view Customer_details as select concat(First_name," ", Last_name) Fullname,Email,Phone_no,State from customer;
select * from Customer_details;

set sql_safe_updates=0;

#Update phone numbers of customers who live in California for Customer_details view. 
update Customer_details set Phone_no=4442229999 where state='California';
select * from Customer_details;

#Count the number of customers in each state and show only states with more than 5 customers. 
select State,count(*) customer_count from customer group by state having count(*)>5;

#Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
select State,count(*) customer_count from customer_details group by state;

#Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state;