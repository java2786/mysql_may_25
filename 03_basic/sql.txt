create database school;
use school;

create table students(
    student_id int,
    name varchar(20),
    class varchar(5),
    marks int
);

insert into students values(101,'ramesh' '8A', 75);

insert into students(name, student_id, marks, class) values('mahesh', 102, 71, '9B');

insert into students(name, student_id, marks, class) values('suresh', 104, 68, '9A');

insert into students(name, student_id, marks, class) values
('dinesh', 104, 68, '9A'),
('kamlesh', 106, 91, '8A'),
('rajesh', 107, 73, '10B'),
('mukesh', 110, 79, '8A'),
('gukesh', 112, 84, '10A'),
('vishesh', 113, 91, '8B');

insert into students(name, student_id, marks, class) values('kishore', 124, 69, '9A');

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



