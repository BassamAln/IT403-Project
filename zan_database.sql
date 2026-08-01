-- Database schema for ZAN Store created for IT403 Project
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Digital_Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    DownloadLink VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Payment_Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Order_Details (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Digital_Products(ProductID)
);

INSERT INTO Customers (CustomerID, FullName, Email) VALUES
(1, 'Ahmed ', 'ahmed@gmail.com'),
(2, 'Sarah ', 'sarah@gmail.com');


INSERT INTO Digital_Products (ProductID, ProductName, Price, DownloadLink) VALUES
(101, 'ZAN Pro Desktop Setup', 49.99, 'https://zan-store.com/download/101'),
(102, 'Streamer Starter Pack', 29.99, 'https://zan-store.com/download/102');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, Payment_Status) VALUES
(1001, 1, '2026-07-30', 'Completed'),
(1002, 2, '2026-07-30', 'Pending');


INSERT INTO Order_Details (OrderID, ProductID, Quantity) VALUES
(1001, 101, 1),
(1002, 102, 2);
