# MySQL Beginner Practice Set (create, INSERT, SELECT, WHERE, Aggregates)
For students who have learned:
- create TABLE
- INSERT INTO
- SELECT (basic queries)
- WHERE clause
- Aggregate functions (SUM, AVG, COUNT, MAX, MIN)
## Problem 1: School Database Setup
Task:
- create a database school.
- create a students table with:
    - student_id (INT, primary key)
    - name (VARCHAR)
    - class (VARCHAR, e.g., "10A")
    - marks (INT)
### Insert 5 records with Indian names (e.g., "Aarav", "Priya").
- Sample Solution:
```sql
create DATABASE school;
use school;
create table students (
    student_id INT primary key,
    name VARCHAR(50),
    class VARCHAR(10),
    marks INT
);
insert into students values  
(1, 'Aarav Sharma', '10A', 85),
(2, 'Priya Patel', '9B', 92),
(3, 'Rohan Gupta', '10A', 78),
(4, 'Ananya Singh', '9B', 88),
(5, 'Vikram Joshi', '10A', 90);
```
## Problem 2: Basic SELECT Queries
Tasks:
- Select all students from class "10A".
- Find students with marks ≥ 85.
- Count how many students are in "9B".
- Expected Output Examples:
```sql
-- 1. All 10A students
SELECT * FROM students WHERE class = '10A';
-- 2. High achievers (marks >= 85)
SELECT name, marks FROM students WHERE marks >= 85;
-- 3. Count 9B students
SELECT COUNT(*) FROM students WHERE class = '9B';
```

## Problem 3: Aggregate Functions
Tasks:
- Find the average marks for each class.
- Get the highest and lowest marks in the school.
- Calculate the total marks of all students.

Sample Solutions:
```sql
-- 1. Average by class
SELECT class, AVG(marks) AS average_marks 
FROM students 
GROUP BY class;
-- 2. Highest and lowest marks
SELECT MAX(marks) AS highest, MIN(marks) AS lowest 
FROM students;
-- 3. Sum of all marks
SELECT SUM(marks) AS total_marks FROM students;
```

## Problem 4: Filtering with WHERE + Aggregates
Tasks:
- Find classes where the average marks are above 85.
- Count how many students scored below the school average.
Hints:
```sql
-- 1. Classes with avg > 85
SELECT class, AVG(marks) 
FROM students 
GROUP BY class 
HAVING AVG(marks) > 85;
-- 2. Students below average
SELECT COUNT(*) 
FROM students 
WHERE marks < (SELECT AVG(marks) FROM students);
```
## Problem 5: Real-World Scenario (Library)
Task: create a books table:
- book_id (INT)
- title (VARCHAR)
- author (VARCHAR)
- pages (INT)

### Insert 5 books (e.g., "The Guide" by R.K. Narayan).
Write queries to:
- Find books with more than 200 pages.
- Calculate the average pages per author.

Sample Data:
```sql
insert into books values 
(1, 'The Guide', 'R.K. Narayan', 250),
(2, 'Wings of Fire', 'A.P.J. Abdul Kalam', 180),
(3, 'The God of Small Things', 'Arundhati Roy', 300);
```

## Problem 6: Bonus Challenges
Tasks:
- Update Priya's marks to 95 (UPDATE statement).
- Delete all books with less than 200 pages.

Solutions:
```sql
-- 1. Update marks
UPDATE students SET marks = 95 WHERE name = 'Priya Patel';
-- 2. Delete short books
DELETE FROM books WHERE pages < 200;
```
# Key Learning Outcomes
- Reinforce basic SQL syntax (create, INSERT, SELECT).
- Master WHERE filtering with numbers/text.
- Practice aggregates (SUM, AVG, COUNT) on real data.