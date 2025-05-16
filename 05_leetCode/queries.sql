drop database if exists tutorial;
create database tutorial;
use tutorial;


create table Person(
    personId int primary key auto_increment,
    lastName varchar(30),
    firstName varchar(30)    
);
insert into Person(personId, lastName, firstName) values(1, 'Mittal', 'Priya');
insert into Person(personId, firstName, lastName) values(2, 'Rahul', 'Kumar');

insert into Person(lastName, firstName) values('Mittal', 'Priyanshu');
insert into Person(firstName, lastName) values('Suresh', 'Kumar');

insert into Person(firstName, lastName) values('Mukesh', 'Kumar');



create table Address(
    addressId int primary key auto_increment,
    personId int,
    city varchar(20),
    state varchar(20),
    foreign key (personId) references Person(personId)
);

insert into Address(personId, city, state) values(1, 'Ghaziabad', 'Uttar Pradesh');
-- insert into Address(personId, city, state) values(101, 'Delhi', 'Delhi');

insert into Address(personId, city, state) values(2, 'Delhi', 'Delhi');
insert into Address(personId, city, state) values(3, 'UP', 'UP');
insert into Address(personId, city, state) values(4, 'Patna', 'Bihar');


-- Find person with first name as Priya
select * from Person where firstName='Priya';

-- Find address with state as up
select * from Address where state='up';

-- find city, state, and total_addresses from address

select count(*) from Address;

-- find firstname of person with id as 1
select firstName from Person where personId = 1;


-- demo
select *, (select count(*) from Address) as total from Address;

-- sub query
select *, (select firstName from Person where personId = personId) as first_name from Address;

select 
    a.addressId, 
    a.personId, 
    a.city, 
    a.state, 
    (select firstName from Person p where p.personId = a.personId) as first_name 
from Address a;


-- Write a solution to report the first name, last name, city, and state of each person in the Person table.

select city from Address where personId = 1;

select 
    firstName, lastName, 
    (select a.city from Address a where a.personId = p.personId) as city,
    (select a.state from Address a where a.personId = p.personId) as state 
from Person p;

