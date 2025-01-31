#1. Add a new column called DOB in Persons table with data type as Date. 
alter table persons add DOB date;
desc persons;

UPDATE Persons SET dob = '1990-05-15' WHERE id = 1;
UPDATE Persons SET dob = '1988-09-22' WHERE id = 2;
UPDATE Persons SET dob = '1995-03-10' WHERE id = 3;
UPDATE Persons SET dob = '1992-07-19' WHERE id = 4;
UPDATE Persons SET dob = '1987-11-02' WHERE id = 5;
UPDATE Persons SET dob = '1993-06-25' WHERE id = 6;
UPDATE Persons SET dob = '1991-08-30' WHERE id = 7;
UPDATE Persons SET dob = '1989-12-17' WHERE id = 8;
UPDATE Persons SET dob = '1996-04-05' WHERE id = 9;
UPDATE Persons SET dob = '1994-10-09' WHERE id = 10;
UPDATE Persons SET dob = '1985-02-14' WHERE id = 11;
UPDATE Persons SET dob = '1986-03-29' WHERE id = 12;

select * from persons;

#2. Write a user-defined function to calculate age using DOB. 

delimiter #
create function Calculate_age(dob date)
returns int
deterministic
begin
	return timestampdiff(YEAR,dob,curdate());
end #
delimiter ;

#3. Write a select query to fetch the Age of all persons using the function that has been created. 
select id,fname,lname,DOB,Calculate_age(DOB) as age from persons;

#4. Find the length of each country name in the Country table. 
select country_name,length(country_name) as name_length from country;

#5. Extract the first three characters of each country's name in the Country table. 
select left(country_name,3) as 'first 3 characters' from country;

#6. Convert all country names to uppercase and lowercase in the Country table.
select upper(country_name) as Uppercase,lower(country_name) as Lowercase from country;
