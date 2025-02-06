use sales;

CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'Arun', 'Nair', 50000, '2023-06-15', 'IT'),
(2, 'Deepa', 'Menon', 60000, '2022-05-10', 'HR'),
(3, 'Vishnu', 'Pillai', 55000, '2021-03-20', 'Finance'),
(4, 'Lekshmi', 'K', 58000, '2020-07-25', 'Marketing'),
(5, 'Suresh', 'Kurup', 62000, '2019-09-05', 'Operations'),
(6, 'Anju', 'R', 53000, '2023-01-15', 'IT'),
(7, 'Mohan', 'Varma', 59000, '2021-11-20', 'Sales'),
(8, 'Reshma', 'nair', 57000, '2022-02-28', 'HR'),
(9, 'Rahul', 'C', 61000, '2020-06-12', 'Finance'),
(10, 'Soumya', 'Iyer', 54000, '2023-04-18', 'Marketing');

select * from worker;


-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table 
-- and then invokes the procedure call. 

delimiter # 
create procedure add_workers(IN id int,IN first_name Varchar(20),IN last_name Varchar(20),IN salary int,IN joinDate DATETIME,IN
department CHAR(25))
begin
 INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
 (id, first_name, last_name, salary, joinDate, department);
end #
delimiter ;

call add_workers(11,'Ajay','Nair',35000,'2023-06-15','IT');
select * from worker;


-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the 
-- worker with the given ID  and returns it in the p_salary parameter. Then make the procedure call. 

delimiter # 
create procedure get_workerById(IN id int ,OUT p_salary int)
begin
	select salary into p_salary from worker where worker_id=id;
end #
delimiter ;

call get_workerById(2,@res);
select @res p_salary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with
-- the given ID.Then make a procedure call. 

delimiter # 
create procedure update_workerById(IN id int ,IN dept varchar(20))
begin
	update worker set Department = dept where worker_id=id;
end #
delimiter ;

call update_workerById(2,'Sales');
select * from worker;


-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve 
-- the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 

delimiter #
create procedure worker_count(IN dept varchar(20),OUT p_workerCount int)
begin
	select count(*) into p_workerCount from worker where Department=dept;
end #
delimiter ;

call worker_count('Finance',@res);
select @res worker_count;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers 
-- in the given department and returns it in the p_avgSalary parameter and call the procedure.

delimiter #
create procedure worker_avgSalary(IN dept varchar(20),OUT p_avgSalary int)
begin
	select avg(Salary) into p_avgSalary from worker where Department=dept;
end #
delimiter ;

call worker_avgSalary('IT',@res);
select @res worker_avgSalary;