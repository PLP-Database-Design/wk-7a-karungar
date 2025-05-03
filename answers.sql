CREATE DATABASE shopdb;
USE shopdb;
-- achieving 1NF
-- Create the table
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255),
    PRIMARY KEY (OrderID, Product) -- Composite key to ensure uniqueness
);

-- Insert the data
INSERT INTO OrderDetails (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- achieving 2NF

-- orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
-- orderProducts table
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- insert values into orders table
INSERT INTO Orders(OrderID,CustomerName)
VALUES
(101,'John Doe'),
(102,'Jane Smith'),
(103,'Emily Clark');

-- insert values into OrderProducts table
INSERT INTO OrderProducts(OrderID,Product,Quantity)
VALUES
(101,"Laptop",2),
(101,"Mouse",1),
(102,"Tablet",3),
(102,"Keyboard",1),
(102,"Mouse",2),
(103,"Phone",1);
