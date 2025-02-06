use sales;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);


INSERT INTO teachers (name, subject, experience, salary) VALUES
('John', 'Mathematics', 10, 50000),
('Smith', 'Physics', 8, 25000),
('Miya', 'Chemistry', 12, 55000),
('Virat', 'Biology', 7, 35000),
('Harsha', 'English', 15, 60000),
('Barath', 'History', 9, 45000),
('Diya', 'Computer Science', 5, 45000),
('Ajay', 'Economics', 11, 50000);

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 

delimiter #
create trigger before_insert_teacher
before insert on teachers
for each row
begin
	if new.salary < 0 then 
    signal sqlstate '45000'
    set message_text = 'salary cannot be negative';
    end If;
end #
delimiter ;

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Roy', 'Chemistry', 4, -10000);

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets 
-- inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 

create table teachers_log(teacher_id int,action_type varchar(20),action_time timestamp);

delimiter #
create trigger after_insert_teacher
after insert on teachers
for each row
begin
	insert into teachers_log values(new.id,'Onboard',now());
end #
delimiter ;

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Maxwell', 'English', 11, 45000);

select * from teachers_log;


-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
 
delimiter #
create trigger before_delete_teacher
before delete on teachers
for each row
begin
	if old.experience > 10 then 
    signal sqlstate '45000'
    set message_text = 'Teacher having experience more than 10 years';
    end If;
end #
delimiter ;

delete from teachers where id=5;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter #
create trigger after_delete_teacher
after delete on teachers
for each row
begin
	insert into teachers_log values(old.id,'deleted',now());
end #
delimiter ;

delete from teachers where id=7;
select * from teachers;
select * from teachers_log;