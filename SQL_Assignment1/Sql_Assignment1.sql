#Create Database 
create database School;
use School;

#Create a table 
create table Student(
rollno int,
name varchar(20),
marks int,
grade char(5)
);

desc Student;

#Inserting values
insert into Student values(101,'Arun',84,'B'),(102,'Diya',96,'A');

#Display Table
select * from Student;

#Adding column contact to the table
alter table Student add contact bigint;
