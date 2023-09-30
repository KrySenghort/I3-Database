create database w3_school;
use w3_school;

CREATE TABLE Customers (
    CustomerID int PRIMARY KEY not null,
    CustomerName text not null,
    City text not null,
    Country text not null
);

CREATE table Categories( 
	CategoryID int primary key not null,
    CategoryName text not null,
    Description text not null
	);

create table Employees(
	EmployeeID int primary key not null,
    LastName text not null,
    FirstName text not null,
    BirthDate date not null,
    Photo text not null,
    Note text not null
);

create table Shippers(
	ShipperID int primary key not null,
    ShipperName text not null,
    Phone text not null
);

create table Suppliers(
	SupplierID int primary key not null,
    SupplierName text not null,
    ContactName text not null,
    Address text not null,
    City text not null,
    PostalCode text not null,
    Country text not null,
    Phone text not null
);

create table Products(
	ProductID int primary key,
    ProductName text not null,
    SupplierID int not null,
    CategoryID int not null,
    Unit text not null,
    Price float not null,
    FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);
    
create table Orders(
	OrderID int primary key not null,
    CustomerID int not null,
    EmployeeID int not null,
    OrderDate date not null,
    ShipperID int not null,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY(ShipperID) REFERENCES Shippers(ShipperID)
);

create table OrderDetails(
	OrderDetailsID int primary key not null,
    OrderID int not null,
    ProductID int not null,
    Quantity int not null,
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

# =================================================================================================================================
# ====================================================== Part 01 ==================================================================
SELECT * from customers;
SELECT Country FROM Customers;
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
# =================================================================================================================================
# ====================================================== Part 02 ==================================================================
SELECT * FROM Customers 
	WHERE CustomerID = 1;

SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';

SELECT * FROM Customers
WHERE City = 'Berlin' OR City = 'Stuttgart';

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

SELECT * FROM Customers
WHERE NOT Country = 'Germany';

SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';
# =================================================================================================================================
# ====================================================== Part 03 ==================================================================
SELECT * FROM Customers
	ORDER BY Country DESC;

SELECT * FROM Customers
	ORDER BY Country, CustomerName;

SELECT * FROM Customers
	ORDER BY Country ASC, CustomerName DESC;
# =================================================================================================================================
# ====================================================== Part 04 ==================================================================
INSERT INTO Customers (CustomerName, City, Country)
	VALUES ('Cardinal', 'Stavanger', 'Norway');

# =================================================================================================================================
# ====================================================== Part 05 ==================================================================
SELECT CustomerName, ContactName, Address
	FROM Customers
		WHERE Address IS NULL;

SELECT CustomerName, ContactName, Address
	FROM Customers
		WHERE Address IS NOT NULL;
# =================================================================================================================================
# ====================================================== Part 06 ==================================================================
UPDATE Customers
	SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
	WHERE CustomerID = 1;

UPDATE Customers
	SET PostalCode = 00000
		WHERE Country = 'Mexico';

UPDATE Customers
	SET PostalCode = 00000;
# =================================================================================================================================
# ====================================================== Part 07 ==================================================================
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
DELETE FROM Customers;
# =================================================================================================================================
# ====================================================== Part 08 ==================================================================
SELECT * FROM Customers
	LIMIT 3;

SELECT * FROM Customers
	WHERE Country='Germany'
		LIMIT 3;
# =================================================================================================================================
# ====================================================== Part 09 ==================================================================
SELECT MIN(Price) AS SmallestPrice FROM Products;
SELECT MAX(Price) AS LargestPrice FROM Products;
# =================================================================================================================================
# ====================================================== Part 10 ==================================================================
SELECT COUNT(ProductID)
	FROM Products;

SELECT AVG(Price)
	FROM Products;

SELECT SUM(Quantity)
	FROM OrderDetails;
# =================================================================================================================================
# ====================================================== Part 11 ==================================================================
SELECT * FROM Customers
	WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
	WHERE CustomerName LIKE '%a';

SELECT * FROM Customers
	WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers
	WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers
	WHERE CustomerName LIKE 'a__%';

SELECT * FROM Customers
	WHERE ContactName LIKE 'a%o';

SELECT * FROM Customers
	WHERE CustomerName NOT LIKE 'a%';

SELECT * FROM Customers
	WHERE City LIKE 'ber%';

SELECT * FROM Customers
	WHERE City LIKE '%es%';

SELECT * FROM Customers
	WHERE City LIKE '_ondon';

SELECT * FROM Customers
	WHERE City LIKE 'L_n_on';
# =================================================================================================================================
# ====================================================== Part 12 ==================================================================
SELECT * FROM Customers
	WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
	WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
	WHERE Country IN (SELECT Country FROM Suppliers);

SELECT * FROM Products
	WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
	WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
	WHERE Price BETWEEN 10 AND 20
		AND CategoryID NOT IN (1,2,3);


























