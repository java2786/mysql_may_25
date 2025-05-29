-- MySQL Joins Practice Guide
-- Step 1: Creating the Database and Tables
DROP DATABASE IF EXISTS tutorial;
CREATE DATABASE IF NOT EXISTS tutorial;
USE tutorial;
-- Table: Employees
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10,2),
DepartmentID INT
);
-- Table: Departments
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(100)
);
-- Table: Projects
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100),
DepartmentID INT
);
-- Table: EmployeeProjects
CREATE TABLE EmployeeProjects (
EmployeeID INT,
ProjectID INT,
HoursWorked INT,
PRIMARY KEY (EmployeeID, ProjectID)
);
-- Step 2: Inserting Data
-- Employees Table
INSERT INTO Employees VALUES
(1, 'Alice', 'Johnson', 55000, 1),
(2, 'Bob', 'Smith', 65000, 2),
(3, 'Charlie', 'Brown', 60000, NULL),
(4, 'David', 'Wilson', 70000, 1),
(5, 'Eve', 'Davis', 55000, 3),
(6, 'abc', 'Brown', 60000, 2),
(7, 'xyz', 'Wilson', 70000, 1),
(8, 'mno', 'Davis', 55000, 3);


-- Departments Table
INSERT INTO Departments VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing');
INSERT INTO Departments VALUES
(4, 'Security');
-- Projects Table
INSERT INTO Projects VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', NULL);
-- EmployeeProjects Table
INSERT INTO EmployeeProjects VALUES
(1, 1, 20),
(2, 2, 15),
(4, 1, 25),
(1, 3, 10),
(5, 3, 30);


SELECT EmployeeID, DepartmentID, Salary,
ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY EmployeeID) AS RowNum,
RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS `Rank`
FROM Employees;


SELECT EmployeeID, DepartmentID, Salary,
RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS `Rank`,
DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS `DenseRank`
FROM Employees;



-- SELECT EmployeeID, DepartmentID, Salary,
-- LEAD(Salary) OVER (PARTITION BY DepartmentID ORDER BY Salary
-- DESC) AS NextSalary
-- FROM Employees;