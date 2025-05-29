
-- Create the database
DROP DATABASE IF EXISTS College;
CREATE DATABASE College;
USE College;


-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CollegeID INT,
    SubjectID INT,
    MarksObtained INT
);

-- Table: Colleges
CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(100)
);

-- Table: Subjects
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100)
);

-- Insert data into Colleges
INSERT INTO Colleges VALUES
(1, 'Indian Institute of Technology'),
(2, 'Delhi University'),
(3, "St. Xavier's College");

-- Insert data into Subjects
INSERT INTO Subjects VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'History'),
(5, 'English');



-- Insert data into Students
INSERT INTO Students(StudentID, StudentName, CollegeID, SubjectID, MarksObtained) VALUES
(1, 'Aarav', 1, 1, 85),
(2, 'Ananya', 1, 2, 90),
(3, 'Ishaan', 2, 4, 70),
(4, 'Priya', 2, 4, 75),
(5, 'Rohan', 3, 3, 60),
(6, 'Sneha', 3, 3, 65),
(7, 'Vikram', 1, 1, 88),
(8, 'Kavya', 1, 2, 78),
(9, 'Aditya', 2, 5, 80),
(10, 'Meera', 3, 5, 85);




-- Show min score of each sub for students
select StudentID, StudentName, SubjectID, MarksObtained, 

-- avg(MarksObtained) over (PARTITION BY SubjectID ORDER BY MarksObtained) as Avg_Score
min(MarksObtained) over (PARTITION BY SubjectID ORDER BY MarksObtained) as MIN_Score

from Students;



-- window func with aggregate function
select StudentID, StudentName, SubjectID, MarksObtained, 

    SUM(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY MarksObtained) AS `Total`
FROM Students
limit 2
;




-- Common Window Functions
SELECT 
    StudentID, 
    SubjectID,
    SUM(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID desc) AS `Total`,
    AVG(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID desc) AS `Average`,
    COUNT(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID desc) AS `Count`,
    MIN(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID desc) AS `Min`,
    MAX(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID desc) AS `Max`
FROM Students;



SELECT
StudentID,
SubjectID,
MarksObtained,
SUM(MarksObtained) OVER (PARTITION BY SubjectID ORDER BY StudentID) AS
CumulativeTotal
FROM Students;
