# MySQL NULL Handling Functions 

## A Practical Guide with LMS Example

This guide covers MySQL's null-handling expressions using a Library Management System (LMS) context. It includes sample data (20 rows per table), usage explanations, and SQL queries for practice.

---

## Table Creation Scripts

### 1. `books` Table

```sql
CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(100),
  author VARCHAR(100),
  total_copies INT,
  available_copies INT
);
```

### Insert Data

```sql
INSERT INTO books VALUES
(1, 'Clean Code', 'Robert Martin', 5, 2),
(2, 'SQL Mastery', NULL, NULL, NULL),
(3, 'Learn Python', 'John Doe', 3, 1),
(4, 'Java Made Easy', 'Suresh Mehta', 6, 4),
(5, 'Data Structures', 'Asha Nair', NULL, 1),
(6, 'Microservices 101', NULL, 4, 0),
(7, 'Power BI Insights', 'Neha Kapoor', 8, NULL),
(8, 'Cloud Fundamentals', NULL, 5, 2),
(9, 'Agile Principles', 'Vikas Sharma', 2, 1),
(10, 'Networking Basics', 'Ravi Iyer', 3, 3),
(11, 'Python for Data Science', NULL, 6, 6),
(12, 'HTML & CSS', 'Rekha Joshi', NULL, NULL),
(13, 'AI for Everyone', 'Arun Nair', 7, 5),
(14, 'Docker Essentials', NULL, 0, 0),
(15, 'Linux Basics', 'Priya Singh', 4, 2),
(16, 'Big Data Intro', NULL, 5, NULL),
(17, 'Software Testing', 'Kiran Desai', NULL, 1),
(18, 'Database Systems', 'Manish Gupta', 10, 10),
(19, 'Excel Tricks', NULL, 2, 1),
(20, 'Cybersecurity Guide', 'Divya Rao', 3, 0);
```

---

### 2. `students` Table

```sql
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);
```

### Insert Data

```sql
INSERT INTO students VALUES
(101, 'Amit', 'amit@gmail.com'),
(102, 'Bhavna', NULL),
(103, 'Chirag', 'chirag@yahoo.com'),
(104, 'Deepa', NULL),
(105, 'Eshan', 'eshan@gmail.com'),
(106, 'Farha', 'farha@outlook.com'),
(107, 'Gaurav', NULL),
(108, 'Harini', 'harini@xyz.com'),
(109, 'Iqbal', NULL),
(110, 'Jaya', 'jaya@hotmail.com'),
(111, 'Kamal', NULL),
(112, 'Lakshmi', 'lakshmi@gmail.com'),
(113, 'Manoj', NULL),
(114, 'Nidhi', 'nidhi@abc.com'),
(115, 'Omkar', 'omkar@edu.com'),
(116, 'Pooja', NULL),
(117, 'Quasar', 'quasar@mail.com'),
(118, 'Ritika', NULL),
(119, 'Sanjay', 'sanjay@live.com'),
(120, 'Tanvi', NULL);
```

---

## IFNULL(expression, alt\_value)

**Purpose**: Returns `alt_value` if `expression` is `NULL`, else returns `expression`.

**Example**:

```sql
SELECT IFNULL(NULL, 'N/A');         -- Returns 'N/A'
SELECT IFNULL('OpenAI', 'N/A');     -- Returns 'OpenAI'
```

### Use in LMS:

```sql
SELECT
  book_id,
  title,
  IFNULL(author, 'Unknown Author') AS author,
  IFNULL(total_copies, 0) AS total_copies,
  IFNULL(available_copies, 0) AS available_copies
FROM books;
```

---

## COALESCE(expr1, expr2, ..., exprN)

**Purpose**: Returns first non-NULL from the list.

**Example**:

```sql
SELECT COALESCE(NULL, NULL, 'Python', 'Java');  -- Returns 'Python'
```

### Use in LMS:

```sql
SELECT
  student_id,
  name,
  COALESCE(email, 'contact@library.com') AS contact_email
FROM students;
```

---

## NULLIF(expr1, expr2)

**Purpose**: Returns `NULL` if expr1 = expr2, else returns expr1.

**Example**:

```sql
SELECT NULLIF(10, 10);  -- Returns NULL
SELECT NULLIF(10, 5);   -- Returns 10
```

### Use in LMS:

```sql
SELECT
  book_id,
  title,
  total_copies,
  available_copies,
  CASE
    WHEN NULLIF(total_copies, 0) IS NULL THEN 'N/A'
    ELSE CONCAT(ROUND((available_copies / total_copies) * 100, 1), '%')
  END AS availability_percentage
FROM books;
```

---

## CASE Statement (for conditional logic)

**Purpose**: SQL equivalent of if...else if...else.

**Example**:

```sql
SELECT
  CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    ELSE 'C'
  END AS grade
FROM students;
```

### Use in LMS:

```sql
SELECT
  book_id,
  title,
  available_copies,
  CASE
    WHEN available_copies IS NULL THEN 'Unknown'
    WHEN available_copies = 0 THEN 'Not Available'
    WHEN available_copies < 2 THEN 'Low Stock'
    ELSE 'In Stock'
  END AS availability_status
FROM books;
```

---

## Summary Table

| Function   | Description                               | Args | Example                             |
| ---------- | ----------------------------------------- | ---- | ----------------------------------- |
| IFNULL()   | Replaces NULL with specified value        | 2    | IFNULL(score, 0)                    |
| COALESCE() | Returns first non-NULL from list          | 2+   | COALESCE(col1, col2, 'default')     |
| NULLIF()   | Returns NULL if two expressions are equal | 2    | NULLIF(salary, 0)                   |
| CASE       | Multi-conditional branching logic         | N/A  | CASE WHEN ... THEN ... ELSE ... END |

---

