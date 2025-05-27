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
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(10),
    city VARCHAR(20)
);
```

### Problem 2: Foreign Key Relationship
Create an exam_scores table with:
- exam_id (PK)
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
-- Example subquery structure
SELECT name FROM students 
WHERE student_id IN (
    SELECT student_id FROM exam_scores 
    WHERE score > (SELECT AVG(score) FROM exam_scores)
);
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
- Modify the FK constraint to automatically delete dependent records (ON DELETE CASCADE).

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


## Solution 1: Database Setup
```sql
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(10),
    city VARCHAR(20)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(30),
    teacher VARCHAR(50)
);

INSERT INTO students (name, class, city) 
VALUES ('Aarav Patel', '10A', 'Mumbai'),
       ('Diya Sharma', '9B', 'Delhi'),
       ('Rohan Gupta', '11C', 'Bangalore');

INSERT INTO subjects (subject_name, teacher) 
VALUES ('Math', 'Mr. Desai'),
       ('Science', 'Ms. Iyer'),
       ('History', 'Mr. Khan');
```

## Solution 4: Top 2 Students
```sql
SELECT 
    s.name,
    (SELECT SUM(score) 
     FROM exam_scores e 
     WHERE e.student_id = s.student_id) AS total_score
FROM students s
ORDER BY total_score DESC
LIMIT 2;
```

## Solution 6: Students Who Never Issued a Book
```sql
SELECT name FROM students
WHERE student_id NOT IN (
    SELECT DISTINCT student_id FROM book_issues
);
```

# Key Learning Outcomes
- Reinforce PK/FK relationships through real-world examples (school, library).
- Subquery mastery by solving ranking and conditional problems.
- Debug errors (e.g., FK violations) for deeper understanding.

