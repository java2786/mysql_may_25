drop database if exists college;
create database college;
use college;

create table students(
    roll_number int primary key auto_increment,
    name varchar(20),
    -- email varchar(30) unique,
    marks decimal(4, 2)
);


insert into students(name, marks) values('ramesh', 96.357);

insert into students(name, marks) values('suresh', 9.637);

insert into students(name, marks) values('mahesh', 91.637);

insert into students(name, marks) values('ramesh', 87);

-- 15000

insert into students(roll_number, name, marks) values(101, 'mukesh', 76.17);
