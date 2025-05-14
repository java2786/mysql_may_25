drop database if exists school;
create database school;
use school;

create table students(
    student_id int primary key auto_increment,
    name varchar(20),
    class varchar(5),
    marks int
);

insert into students values('ramesh' '8A', 75);

insert into students(name, marks, class) values('mahesh', 71, '9B');

insert into students(name, marks, class) values('suresh', 68, '9A');

insert into students(name, marks, class) values
('dinesh', 68, '9A'),
('kamlesh', 91, '8A'),
('rajesh', 73, '10B'),
('mukesh', 79, '8A'),
('gukesh', 84, '10A'),
('vishesh', 91, '8B');

insert into students(name, marks, class) values('kishore', 69, '9A');

select * from students;

select * from students where class='10A';

select * from students where marks>71;
select * from students where marks>=71;

select * from students where marks<71;


select sum(marks) from students;

select count(marks) from students;


select sum(marks) / count(marks) from students;
select avg(marks) from students;


select count(*) from students where class='9B';



select max(marks) from students;
select min(marks) from students;

select max(marks), min(marks) from students;

select max(marks) as max_marks, min(marks) as min_marks from students;

select sum(marks) as total_marks from students;


-- Group By
select avg(marks), class from students group by class;
-- for condition in group by, we use having instead of where
select avg(marks), class from students group by class having avg(marks) >= 85;




select * from students where marks < (select avg(marks) from students);
select count(*) from students where marks < (select avg(marks) from students);

