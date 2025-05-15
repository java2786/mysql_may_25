# MySql Queries
- mysql -u root -proot
- mysql --host localhost --port 3306 -u root -proot

```sql
show databases;
drop database if exists tutorial;
create database tutorial;
use tutorial;


create table students(
    roll int unique,
    name varchar(15), 
    marks int
);

insert into students(roll, name, marks) values(1, 'ramesh', 0);
insert into students(roll, name, marks) values(2, 'suresh', 0);
insert into students(roll, name, marks) values(3, 'ramesh', 0);

-- update students set marks = 81 where name = 'ramesh' and marks = 0;
update students set marks = 81 where roll=1;

insert into students(roll, name, marks) values(2, 'mahesh', 0);

```


## Unique Key Constraint
```sql
drop database if exists tutorial;
create database tutorial;
use tutorial;


create table students(
    roll int unique,
    name varchar(15), 
    marks int
);

create table courses(
    course_id int unique,
    name varchar(15)
);

insert into students(roll, name, marks) values(1, 'ramesh', 0);
insert into students(roll, name, marks) values(2, 'suresh', 0);
insert into students(roll, name, marks) values(3, 'ramesh', 0);
insert into students(roll, name, marks) values(2, 'mahesh', 0);

insert into courses(course_id, name) values(101, 'Java');
insert into courses(course_id, name) values(102, 'Python');
insert into courses(course_id, name) values(103, 'Mysql');
insert into courses(course_id, name) values(104, 'CPP');
insert into courses(course_id, name) values(102, 'Testing');


create table enrollments(
    std_id int,
    course_id int
);

insert into enrollments(std_id, course_id) values(1, 102);
insert into enrollments(std_id, course_id) values(1, 103);

insert into enrollments(std_id, course_id) values(3, 101);

insert into enrollments(std_id, course_id) values(5, 110);


``` 

## Primary Key
```sql
drop database if exists tutorial;
create database tutorial;
use tutorial;


create table students(
    roll int primary key,
    name varchar(15), 
    marks int
);

create table courses(
    course_id int primary key,
    name varchar(15)
);

insert into students(roll, name, marks) values(1, 'ramesh', 0);
insert into students(roll, name, marks) values(2, 'suresh', 0);
insert into students(roll, name, marks) values(3, 'ramesh', 0);
-- insert into students(roll, name, marks) values(2, 'mahesh', 0);

-- insert into students(roll, name, marks) values(1, 'kamlesh', 0);

insert into courses(course_id, name) values(101, 'Java');
insert into courses(course_id, name) values(102, 'Python');
insert into courses(course_id, name) values(103, 'Mysql');
insert into courses(course_id, name) values(104, 'CPP');
-- insert into courses(course_id, name) values(102, 'Testing');


create table enrollments(
    std_id int,
    course_id int,
    FOREIGN KEY (std_id) references students(roll),
    FOREIGN KEY (course_id) references courses(course_id)
);

insert into enrollments(std_id, course_id) values(1, 102);
insert into enrollments(std_id, course_id) values(1, 103);

insert into enrollments(std_id, course_id) values(3, 101);

insert into enrollments(std_id, course_id) values(5, 110);


``` 


## Combination of primary key
```sql
create table paytm_user(
    phone varchar(10) primary key, -- candidate key
    adhar_num varchar(12), -- candidate key
    email varchar(50), -- candidate key
    name varchar(15)
);



create table enrollments(
    std_id int,
    course_id int,
    marks int,
    FOREIGN KEY (std_id) references students(roll),
    FOREIGN KEY (course_id) references courses(course_id),
    primary key (std_id, course_id)
);

insert into enrollments(std_id, course_id, marks) values(1, 102, 86);
insert into enrollments(std_id, course_id, marks) values(1, 103, 84);

insert into enrollments(std_id, course_id, marks) values(3, 101, 83);


insert into enrollments(std_id, course_id, marks) values(1, 102, 89);


```

## Auto increment
```sql
create table students(
    roll int primary key auto_increment,
    name varchar(15) unique, 
    marks int
);


insert into students(name, marks) values('ramesh', 0);
insert into students(name, marks) values('suresh', 0);
insert into students(name, marks) values('ramesh', 0);

insert into students(name, marks) values('mahesh', 0);

insert into students(name, marks) values('kamlesh', 0);

```