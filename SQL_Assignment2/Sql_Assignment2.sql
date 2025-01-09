#Create database
create database Sales;
use Sales;

#Create table 'Orders'
create table Orders(
order_id int primary key auto_increment,
customer_name varchar(20) not null,
product_category varchar(20),
ordered_item varchar(20),
contact_no bigint unique
);

desc Orders;

#Add new column
alter table Orders add column order_quantity int;

#rename the table
rename table Orders to Sales_Orders;

desc Sales_Orders;

#Insert values to the table
insert into Sales_Orders values
(null,'vimal','fashion','pant',6845123322,2),
(null,'geethu','electronics','iphone',7095123018,1),
(null,'asif','beauty','sunscreen',9865101377,2),
(null,'unni','appliance','fridge',8864790124,1),
(null,'tony','fashion','shirt',9965832477,2),
(null,'john','electronics','laptop',8965432877,1),
(null,'vimal','fashion','jacket',8655259064,2),
(null,'david','electronics','iphone',9167884244,1),
(null,'sneha','fashion','kurthi',9070000422,3),
(null,'adarsh','electronics','printer',8850621833,1),
(null,'arsha','beauty','shamboo',8755501120,1),
(null,'nikitha','appliance','washing machine',9129305544,1);

select * from Sales_Orders;

select customer_name,ordered_item from Sales_Orders;

#Update item
update Sales_Orders set ordered_item='nike shoes' where order_id=1;

#Delete table from database
Drop table Sales_Orders;

