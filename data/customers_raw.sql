Raw customer data with inconsistencies
  
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    City VARCHAR(50),
    Email VARCHAR(100),
    Balance DECIMAL(10,2)
);


INSERT INTO Customers (CustomerID, FullName, City, Email, Balance) VALUES
(1, 'john doe', 'lagos', 'JOHN.DOE@mail.com', 2500.00),
(2, 'Jane Smith', 'abuja', 'jane.smith@mail.com', 3000.00),
(3, 'Michael   Johnson', 'Port harcourt', NULL, 1500.00),
(4, 'Emily Davis', 'lagos', 'emily.davis@mail.com', NULL),
(5, 'David Brown', 'Abuja', 'david.brown@mail.com', 3000.00),
(6, 'Sarah Wilson', 'Abuja', 'sarah.wilson@mail.com', 3000.00),
(7, 'Chris Taylor', 'Kano', 'chris.taylor@mail.com', 1800.00),
(8, 'John Doe', 'Lagos', 'john.doe@mail.com', 2500.00),
(9, '  anna   lee ', 'ibadan', 'anna.lee@mail.com', 2200.00),
(10, 'Mark White', NULL, 'mark.white@mail.com', 1750.00);

