INSERT INTO Students (StudentName, City) VALUES ('Mukesh Kumar', 'Patna');


CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

ALTER TABLE Students MODIFY COLUMN Age int not null;
ALTER TABLE Students MODIFY COLUMN Age int not null default 15;

INSERT INTO Students (StudentName, City) VALUES ('Mukesh Kumar', 'Patna');



ALTER TABLE Students ADD COLUMN Gender enum('male', 'female');


ALTER TABLE Students MODIFY COLUMN Gender enum('male', 'female') not null default 'male';


INSERT INTO Students (StudentName, City) VALUES ('Md Rafi', 'Mumbai');
INSERT INTO Students (StudentName, City, Gender) VALUES ('Lata Mangeshkar', 'Mumbai', 'female');



ALTER TABLE Students modify COLUMN Gender VARCHAR(10);
INSERT INTO Students (StudentName, City, Gender) VALUES ('Lata Mangeshkar', 'Mumbai', 'mahila');


ALTER TABLE Students add COLUMN subject enum('hinid', 'math', 'science');

INSERT INTO Students (StudentName, subject) VALUES ('Ramesh', 'mysql');

-----------------------------

insert into orders values(1, 4, 'sun');

insert into orders values(2, 5, 'ravivar');

ALTER TABLE Students modify COLUMN Female enum('yes', 'no') default 'yes';


