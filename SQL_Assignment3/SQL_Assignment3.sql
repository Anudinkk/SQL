use sales;

#Create a table
create table Managers(
manager_id int auto_increment primary key,
first_name varchar(20),
last_name varchar(20),
DOB date,
age int check(Age between 18 and 30),
last_update date,
gender char(5),
department varchar(20),
salary int not null
);

desc Managers;

#Insert into the table
INSERT INTO Managers (first_name, last_name, DOB, age, last_update, gender, department, salary)
VALUES
('Alice', 'Johnson', '1995-04-12', 28, '2025-01-10', 'F', 'HR', 60000),
('Bob', 'Smith', '1996-08-23', 27, '2025-01-10', 'M', 'Finance', 70000),
('Charlie', 'Brown', '1998-02-15', 25, '2025-01-10', 'M', 'IT', 80000),
('Diana', 'Prince', '1994-12-05', 30, '2025-01-10', 'F', 'Marketing', 75000),
('Ethan', 'Hunt', '1997-03-19', 26, '2025-01-10', 'M', 'Operations', 65000),
('Fiona', 'Taylor', '1995-06-08', 28, '2025-01-10', 'F', 'Sales', 72000),
('George', 'Williams', '1999-09-12', 24, '2025-01-10', 'M', 'HR', 58000),
('Aaliya', 'Davis', '1998-11-25', 25, '2025-01-10', 'F', 'Finance', 64000),
('Ian', 'Clark', '1996-07-30', 27, '2025-01-10', 'M', 'IT', 81000),
('Jessica', 'Lee', '1997-10-21', 26, '2025-01-10', 'F', 'Marketing', 73000),
('Kevin', 'White', '1995-05-15', 28, '2025-01-10', 'M', 'Operations', 70000),
('Laura', 'Martin', '1999-01-20', 24, '2025-01-10', 'F', 'Sales', 67000);

#Display table
select * from Managers;

#Display annual income of all managers
select MANAGER_id,first_name,salary*12 annual_salary from Managers;

#Dispaly records of all manager except 'Aaliya'
select * from Managers where first_name <> 'Aaliya';

#Dispaly records of all manager whose  department is 'IT' and salary greater than 25000
select * from Managers where department = 'IT' and salary>25000;

#Dispaly records of all manager whose salary between 10000 and 35000
select * from Managers where salary between 10000 and 35000;

