# MySQL Practice Problems (Before JOINs)

## Tables to Create

Students should write their own CREATE TABLE and INSERT INTO statements based on the following schema and fill each with 5–10 records.

```sql
-- Table 1: Customers
-- Fields: CustomerID (PK), CustomerName, City, State

-- Table 2: Orders
-- Fields: OrderID (PK), CustomerID (FK), OrderDate, TotalAmount

-- Table 3: Products
-- Fields: ProductID (PK), ProductName, Price

-- Table 4: Employees
-- Fields: EmployeeID (PK), EmployeeName, Department, Salary
```


# MySQL INSERT Queries for Practice

## Customers

```sql
INSERT INTO Customers (CustomerID, CustomerName, City, State) VALUES
(1, 'Riya Malhotra', 'Mumbai', 'Maharashtra'),
(2, 'Arjun Patel', 'Delhi', 'Delhi'),
(3, 'Neha Sharma', 'Bangalore', 'Karnataka'),
(4, 'Siddharth Mehta', 'Ahmedabad', 'Gujarat'),
(5, 'Pooja Singh', 'Jaipur', 'Rajasthan'),
(6, 'Mohit Kapoor', 'Kolkata', 'West Bengal'),
(7, 'Simran Kaur', 'Chandigarh', 'Punjab'),
(8, 'Amit Trivedi', 'Lucknow', 'Uttar Pradesh'),
(9, 'Kavya Reddy', 'Hyderabad', 'Telangana'),
(10, 'Rajesh Kumar', 'Chennai', 'Tamil Nadu');
```

## Products

```sql
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(101, 'Bluetooth Speaker', 1299.00),
(102, 'Smartphone Case', 399.00),
(103, 'Laptop Stand', 999.00),
(104, 'Noise Cancelling Headphones', 3499.00),
(105, 'Portable SSD 500GB', 4499.00),
(106, 'Wireless Mouse', 699.00),
(107, 'Keyboard', 849.00),
(108, 'Webcam', 1899.00),
(109, 'LED Desk Lamp', 599.00),
(110, 'Fitness Tracker', 2199.00);
```

## Orders

```sql
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-05-01', 1899.00),
(2, 2, '2024-05-02', 4499.00),
(3, 3, '2024-05-03', 2598.00),
(4, 1, '2024-05-04', 999.00),
(5, 4, '2024-05-04', 1299.00),
(6, 2, '2024-05-05', 399.00),
(7, 5, '2024-05-06', 699.00),
(8, 6, '2024-05-07', 2199.00),
(9, 3, '2024-05-08', 849.00),
(10, 1, '2024-05-09', 599.00);
```

You can later add OrderItems table to break down which products were in each order.

## Employees

```sql
INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary) VALUES
(1, 'Ankita Desai', 'Sales', 52000.00),
(2, 'Rahul Joshi', 'IT', 68000.00),
(3, 'Sanjay Menon', 'HR', 45000.00),
(4, 'Isha Dutta', 'Marketing', 55000.00),
(5, 'Kunal Roy', 'Finance', 60000.00),
(6, 'Reena Verma', 'Sales', 51000.00),
(7, 'Tarun Arora', 'Operations', 58000.00),
(8, 'Divya Iyer', 'IT', 70000.00),
(9, 'Vikram Bhat', 'HR', 48000.00),
(10, 'Preeti Nair', 'Finance', 61000.00);
```




## Practice Problems

### 1. List all customers from Maharashtra.
```sql
SELECT * FROM Customers
WHERE State = 'Maharashtra';
```

### 2. Count total number of orders.
```sql
SELECT COUNT(*) FROM Orders;
```

### 3. Calculate total sales amount from orders.
```sql
SELECT SUM(TotalAmount) FROM Orders;
```

### 4. Find customers who placed an order with a total > 500.
```sql
SELECT * FROM Orders
WHERE TotalAmount > 500;
```

### 5. Customers who placed orders in April 2023.
```sql
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2023-04-01' AND '2023-04-30';
```

### 6. List products priced above average.
```sql
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
```

### 7. Employees earning more than ₹50,000.
```sql
SELECT * FROM Employees
WHERE Salary > 50000;
```

### 8. Show max and min prices of all products.
```sql
SELECT MAX(Price), MIN(Price) FROM Products;
```

### 9. Cities having more than one customer.
```sql
SELECT City, COUNT() AS CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT() > 1;
```

### 10. Customers who placed at least one order.
```sql
SELECT CustomerName FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);
```

### 11. Top 3 most expensive products.
```sql
SELECT * FROM Products
ORDER BY Price DESC
LIMIT 3;
```

### 12. Lowest salary in the 'Sales' department.
```sql
SELECT * FROM Employees
WHERE Department = 'Sales'
ORDER BY Salary ASC
LIMIT 1;
```