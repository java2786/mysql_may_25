# ALTER usage 
Examples (add, modify, drop columns; rename columns and tables)

# Setup - Create and Populate Tables
```sql
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

-- Insert sample data
INSERT INTO Students (StudentName, Age, City) VALUES
('Aarav Mehta', 15, 'Ahmedabad'),
('Sneha Singh', 16, 'Lucknow'),
('Rohit Sharma', 14, 'Mumbai'),
('Diya Patel', 17, 'Surat'),
('Karan Verma', 15, 'Jaipur');
```
## ALTER TABLE Usage Examples
### Add a new column
```sql
ALTER TABLE Students ADD COLUMN Gender VARCHAR(10);

ALTER TABLE Students ADD COLUMN Gender enum('male', 'female') not null default 'male';
```

## Add multiple columns
```sql
ALTER TABLE Students
ADD COLUMN Class VARCHAR(10),
ADD COLUMN Marks INT;
```

## Modify column datatype or size
```sql
ALTER TABLE Students MODIFY COLUMN City VARCHAR(100);
```
## Rename a column
```sql
ALTER TABLE Students RENAME COLUMN StudentName TO FullName;
```
## Drop (remove) a column
```sql
ALTER TABLE Students DROP COLUMN Marks;
```

## Rename the table
```sql
RENAME TABLE Students TO SchoolStudents;
```
## Practice Exercises
- Add a column Email of type VARCHAR(100) to the table.
- Add a new column DOB of type DATE.
- Change the datatype of Age from INT to TINYINT.
- Rename column FullName back to StudentName.
- Drop the column Class from the table.
- Rename the table SchoolStudents to StudentsInfo.