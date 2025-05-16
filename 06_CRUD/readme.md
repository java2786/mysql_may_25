# Mysql CRUD Operations 

```sql 

drop database if exists tutorial; 

create database tutorial; 

use tutorial; 

``` 

 

## Create table for Customers 

```sql 

CREATE TABLE Customers ( 

  CustomerID INT AUTO_INCREMENT PRIMARY KEY, 

  CustomerName VARCHAR(50) NOT NULL, 

  City VARCHAR(50), 

  State VARCHAR(50) 

); 

```  

## Insert data into Customers table 

```sql 

INSERT INTO Customers (CustomerName, City, State) 

VALUES 

  ('Aadhav Patel', 'Mumbai', 'Maharashtra'), 

  ('Priya Sharma', 'Delhi', 'Delhi'), 

  ('Raj Kapoor', 'Kolkata', 'West Bengal'), 

  ('Neha Gupta', 'Chennai', 'Tamil Nadu'), 

  ('Aditya Chopra', 'Bangalore', 'Karnataka'), 

  ('Riya Malhotra', 'Hyderabad', 'Telangana'), 

  ('Arjun Singh', 'Pune', 'Maharashtra'), 

  ('Pooja Verma', 'Jaipur', 'Rajasthan'), 

  ('Rohan Mehta', 'Ahmedabad', 'Gujarat'), 
  ('Mohan Mishra', 'Patna', 'Bihar'), 

  ('Nisha Kapoor', 'Lucknow', 'Uttar Pradesh'); 

```  

## Create table for Employees 

```sql 

CREATE TABLE Employees ( 

  EmployeeID INT AUTO_INCREMENT PRIMARY KEY, 

  EmployeeName VARCHAR(50) NOT NULL, 

  Department VARCHAR(50), 

  Salary DECIMAL(10,2) 

); 

```  

## Insert data into Employees table 

```sql 

INSERT INTO Employees (EmployeeName, Department, Salary) 

VALUES 

  ('Priya Sharma', 'Sales', 50000), 

  ('Raj Kapoor', 'IT', 65000), 

  ('Neha Gupta', 'HR', 45000), 

  ('Aditya Chopra', 'Marketing', 55000), 

  ('Riya Malhotra', 'Finance', 60000), 

  ('Arjun Singh', 'Operations', 48000), 

  ('Pooja Verma', 'Sales', 52000), 

  ('Rohan Mehta', 'IT', 68000), 

  ('Nisha Kapoor', 'HR', 42000), 

  ('Aadhav Patel', 'Sales', 47000); 

```  

## Create table for Products 

```sql
CREATE TABLE Products ( 

  ProductID INT PRIMARY KEY, 

  ProductName VARCHAR(50) NOT NULL, 

  Price DECIMAL(10,2) 

); 

```

## Insert data into Products table 

```sql 

INSERT INTO Products (ProductID, ProductName, Price) 

VALUES 

  (101, 'Basmati Rice', 50.99), 

  (102, 'Turmeric Powder', 25.75), 

  (103, 'Chickpeas', 35.50), 

  (104, 'Mustard Oil', 45.99), 

  (105, 'Garam Masala', 15.25), 

  (106, 'Cumin Seeds', 12.50), 

  (107, 'Coriander Powder', 18.75), 

  (108, 'Fennel Seeds', 14.99), 

  (109, 'Cardamom', 75.00), 

  (110, 'Saffron', 500.00); 

```

  

## Create table for Orders 

```sql 

CREATE TABLE Orders ( 

  OrderID INT AUTO_INCREMENT PRIMARY KEY, 

  CustomerID INT, 

  OrderDate DATE, 

  TotalAmount DECIMAL(10,2), 

  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 

); 

```  

## Insert data into Orders table 

```sql 

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) 

VALUES 

  (1, '2023-04-01', 250.99), 

  (2, '2023-04-02', 175.75), 

  (3, '2023-04-03', 135.50), 

  (4, '2023-04-04', 245.99), 

  (5, '2023-04-05', 115.25), 

  (6, '2023-04-06', 112.50), 

  (7, '2023-04-07', 118.75), 

```   

 

# CREATE: Inserting Data 

## Single row insert 

```sql 

INSERT INTO Customers (CustomerName, City, State) VALUES  

('Aadhav Patel', 'Mumbai', 'Maharashtra'); 

```  

## Multiple row insert 

```sql 

INSERT INTO Employees (EmployeeName, Department, Salary) 

VALUES 

  ('Priya Sharma', 'Sales', 50000), 

  ('Raj Kapoor', 'IT', 65000), 

  ('Neha Gupta', 'HR', 45000); 

```  

# INSERT IGNORE and ON DUPLICATE KEY UPDATE 

```sql 

INSERT INTO Products (ProductID, ProductName, Price) VALUES  

(101, 'Basmati Rice', 50.99) 

ON DUPLICATE KEY UPDATE Price = 55.99; 

```

 

# READ: Retrieving Data 

## Basic SELECT statement 

```sql 

SELECT * FROM Customers; 

```  

## Column selection and aliasing 

```sql 

SELECT CustomerName AS 'Customer', City, State 

FROM Customers; 

```  

## Simple filtering with WHERE 

```sql 

SELECT * FROM Employees 

WHERE Department = 'Sales'; 

```  

## Introduction to result set ordering 

```sql 

SELECT EmployeeName, Salary 

FROM Employees 

ORDER BY Salary DESC; 

```  

## LIMIT and OFFSET for pagination 

```sql 

SELECT * FROM Products 

LIMIT 10 OFFSET 20; 

``` 

 

# UPDATE: Modifying Existing Data 

## UPDATE statement syntax 

```sql 

UPDATE Customers 

SET City = 'Bangalore' 

WHERE CustomerName = 'Aadhav Patel'; 

```  

## Single table updates 

```sql 

UPDATE Employees 

SET Salary = Salary * 1.1 

WHERE Department = 'IT'; 

```  

## Multi-table updates 

```sql 

UPDATE Employees e 

JOIN Departments d ON e.DepartmentID = d.DepartmentID 

SET e.Salary = e.Salary * 1.15 

WHERE d.DepartmentName = 'Marketing'; 

 

UPDATE Employees SET Salary = Salary * 1.15 WHERE Department = ( SELECT Department FROM Employees WHERE Department = 'Marketing' LIMIT 1 ); 

``` 

 

## DELETE vs TRUNCATE operations 

```sql 

DELETE FROM Orders 

WHERE OrderDate < '2022-01-01'; 

 

TRUNCATE TABLE Logs; 

```  

## Single and multi-table deletions 

```sql 

DELETE FROM Customers 

WHERE CustomerName = 'Aadhav Patel'; 

  

DELETE c 

FROM Customers c 

JOIN Orders o ON c.CustomerID = o.CustomerID 

WHERE o.OrderDate < '2022-01-01'; 

``` 

 

# Soft delete implementation concepts: 

## Add a 'deleted' column to the table 

```sql 

ALTER TABLE Customers ADD COLUMN deleted BOOLEAN DEFAULT FALSE; 

```  

## Update the 'deleted' column instead of deleting the row 

```sql 

UPDATE Customers 

SET deleted = TRUE 

WHERE CustomerName = 'Aadhav Patel'; 

```  

## Filter out deleted rows in queries 

```sql 

SELECT * 

FROM Customers 

WHERE deleted = FALSE; 

``` 

 

# practice exercises: 

List all customers from Maharashtra. 

Update salary of employee named 'Raj Kapoor' by 5%. 

Delete a product with ProductID = 108. 

Retrieve only customer names who placed orders after '2023-04-01'. 

 