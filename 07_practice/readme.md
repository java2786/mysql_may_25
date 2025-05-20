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


# Key Learning Outcomes
- Reinforce PK/FK relationships through real-world examples (school, library).
- Subquery mastery by solving ranking and conditional problems.
- Debug errors (e.g., FK violations) for deeper understanding.

