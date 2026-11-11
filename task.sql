CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Country    VARCHAR(50),
    Score      INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product   VARCHAR(100),
    Category  VARCHAR(50),
    Price     DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Department VARCHAR(50),
    BirthDate  DATE,
    Gender     VARCHAR(10),
    Salary     DECIMAL(10,2),
    ManagerID  INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Orders (
    OrderID       INT PRIMARY KEY,
    ProductID     INT,
    CustomerID    INT,
    SalesPersonID INT,
    OrderDate     DATE,
    ShipDate      DATE NULL,
    OrderStatus   VARCHAR(30),
    ShipAddress   VARCHAR(150),
    BillAddress   VARCHAR(150),
    Quantity      INT,
    Sales         DECIMAL(10,2),
    CreationTime  DATETIME,
    FOREIGN KEY (ProductID)     REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID)    REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Customers(CustomerID, FirstName, LastName, Country, Score) VALUES
(1, 'Ayla', 'Karimova', 'Azerbaijan', 720),
(2, 'John',  'Miller',   'USA',        450),
(3, 'Emma',  'Schmidt',  'Germany',    860),
(4, 'Sara',  'Martin',   'France',     280),
(5, 'Lukas', 'Weber',    'Germany',    550);

INSERT INTO Products (ProductID, Product, Category, Price) VALUES
(101, 'Wireless Mouse', 'Electronics', 55),
(102, 'Office Chair',   'Furniture',   230),
(103, 'Laptop',         'Electronics', 850),
(104, 'Notebook',       'Stationery',  12),
(105, 'Smart Phone',    'Electronics', 420);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES
(12, 'Maya',  'Brown',    'Sales',   '1988-03-14', 'Female', 2400, NULL),
(11, 'David', 'Lee',      'Sales',   '1990-07-22', 'Male',   2200, 12),
(13, 'Alex',  'Green',    'Support', '1992-11-05', 'Male',   1900, 12);

INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, Quantity, Sales) VALUES
(201, 101, 1, 11, '2026-10-04', '2026-10-06', 'Delivered', 2, 110),
(202, 103, 3, 12, '2026-10-08', '2026-10-10', 'Shipped', 1,  850),
(203, 102, 2, 11, '2026-10-12', NULL,         'Pending', 1,  230),
(204, 105, 5, 12, '2026-10-15', '2026-10-25', 'Delivered', 1,  420);

SELECT * FROM Customers;
SELECT FirstName, LastName, Country FROM Customers;

SELECT CustomerID, FirstName, LastName, Country
FROM Customers WHERE Country = 'Germany';

SELECT FirstName, LastName, Country, Score
FROM Customers
WHERE Score >= 300 AND Country IN ('Germany', 'France');
