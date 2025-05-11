# Create book table
```sql
drop database tutorial;
create database tutorial;
use tutorial;

-- title, author, price, category, publish_date

create table books(
    title varchar(50),
    author varchar(50),
    price int,
    category varchar(50),
    publish_date varchar(10)
);

insert into books();

show tables; -- list of table available in database
desc books; -- show table structure


-- insert NULL everywhere
insert into books values();

-- insert into books values('khatri', 100, 'superman', 'comic', '02/05/2015');


insert into books values
('superman', 'khatri', 100, 'comic', '02/05/2015');


insert into books(category, publish_date, price, title, author) values
('comic', '11/02/2018', 100, 'spiderman', 'clark');

select author, price, title, category, publish_date from books;

select * from books;



insert into books(category, publish_date, price, title, author) values
('comic', '11/02/2018', 100, 'spiderman', 'clark'),
('comic', '11/02/2018', 100, 'ironman', 'tony'),
('computer language', '25/04/2017', 500, 'mukta', 'clark');

```

# SQL Practice

## Customer Table:
- name: The name of the customer.
- address: The address of the customer.
- phone: The phone number of the customer.

## Item Table:
- name: The name of the item.
- price: The price of the item.

## Insert data into tables
- Customer: 'Ramesh', 'Punjab', '9685968596'
- Item: 'Mobile', 12000