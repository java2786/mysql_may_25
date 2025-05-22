# MySQL Practice Set (Hands-On Session)
Topics Covered:
- CREATE TABLE, Data Types
- INSERT, SELECT
- PRIMARY KEY, FOREIGN KEY
- Subqueries

## Practice Problems (Self-Learning Focused)
Each problem builds on previous concepts. Encourage students to try solving themselves first before checking solutions!

### Problem 1: Database Setup (Indian School System)
Task:
- Create a database school_db.
- Create two tables:
	- students (student_id PK, name, class, city)
	- subjects (subject_id PK, subject_name, teacher)

#### Insert 5 Indian student records (e.g., "Aarav Patel", "Diya Sharma") and 3 subjects ("Math", "Science", "History").

### Problem 2: Foreign Key Relationship
Create an exam_scores table with:
- student_id (FK → students)
- subject_id (FK → subjects)
- score (INT)

#### Insert 5 exam score records (ensure valid student/subject IDs).
Challenge: Try inserting an invalid student_id and observe the error.

### Problem 3: Subquery Practice
Task:
- Find students who scored above average in "Math".
- List subjects where no student scored below 40.

```sql
drop database if exists school_db;

create database school_db;

use school_db;

create table Students(
    student_id int primary key auto_increment,
    name varchar(50),
    class varchar(4),
    city varchar(50)
);

create table Subjects(
    subject_id int primary key auto_increment,
    subject_name varchar(50),
    teacher varchar(50)
);

INSERT INTO Students (name, class, city) 
VALUES ('Aarav Patel', '10A', 'Mumbai'),
       ('Diya Sharma', '9B', 'Delhi'),
       ('Rohan Gupta', '11C', 'Bangalore');

INSERT INTO Subjects (subject_name, teacher) 
VALUES ('Math', 'Mr. Desai'),
       ('Science', 'Ms. Iyer'),
       ('History', 'Mr. Khan');


create table Exam_scores(
    student_id int,
    subject_id int,
    score int,
    foreign key (student_id) references Students(student_id),
    foreign key (subject_id) references Subjects(subject_id),
    primary key(student_id, subject_id)
);

-- insert into Exam_scores (student_id, subject_id, score) values(5, 3, 65);


insert into Exam_scores (student_id, subject_id, score) values(1, 3, 85);

-- insert into Exam_scores (student_id, subject_id, score) values(1, 3, 65);


insert into Exam_scores (student_id, subject_id, score) values
(1, 1, 76),
(1, 2, 96),
(2, 1, 97),
(2, 3, 78),
(3, 1, 82),
(3, 2, 85);


INSERT INTO Students (name, class, city) 
VALUES ('Ram Kumar', '9B', 'Patna');

INSERT INTO Subjects (subject_name, teacher) 
VALUES ('Hindi', 'Mr. Suresh');





select * from Students where student_id in (select student_id from Exam_scores where score > (select avg(score) from Exam_scores where subject_id = (select subject_id from Subjects where subject_name='Math')) and subject_id = (select subject_id from Subjects where subject_name='Math'));




select * from Subjects where subject_id in (select subject_id from Exam_scores where score < 40);


```

### Problem 4: Advanced Subquery 
Task:
- Find the top 2 students by total score across all subjects.
- Bonus: Use a subquery to find students who scored higher than their class average.
- Expected Output:
```plaintext
student_name	total_score
Diya Sharma		285
```

### Problem 5: Data Integrity Challenge
Task:
- Delete a student from the students table.
- Observe what happens to their exam_scores records.

### Problem 6: Real-World Scenario (Library System)
Task:
- Create a books table (book_id, title, author).
- Create a book_issues table with:
	- issue_id (PK)
	- student_id (FK)
	- book_id (FK)
	- due_date (DATE)

- Write a query to find students who never issued a book.
- Hint: Use NOT IN with a subquery.

### Problem 7: Self-Referencing Table (Bonus)
Task:
- Create a staff table where each teacher has a reports_to field pointing to another staff member.
- Insert data showing hierarchy (e.g., "Principal" → "HOD" → "Teacher").
- Write a query to show who reports to whom.


# Key Learning Outcomes
- Reinforce PK/FK relationships through real-world examples (school, library).
- Subquery mastery by solving ranking and conditional problems.
- Debug errors (e.g., FK violations) for deeper understanding.

