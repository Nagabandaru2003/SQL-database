create database SBI;
use SBI;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    PhoneNumber bigint,
    Email VARCHAR(50)
);
INSERT INTO Customers (FirstName, LastName, Address, PhoneNumber, Email)
VALUES ('John', 'Doe', '123 Street, City', '9876543210', 'john.doe@example.com'),
('naga', 'Bandaru', '423 Street, City', '9392727193', 'nagasarojab@gmail.com'),
('subbu', 'tanguri', '143 Street, City', '6303493302', 'subbut@gmail.com'),
('sai', 'chintha', '1432 Street, City', '9898989898', 'sait@gmail.com'),
('manju', 'gali', 'main Street, City', '6363636363', 'manju@gmail.com');
select * from Customers;
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(50),
    Location VARCHAR(100),
    Manager VARCHAR(50)
);
insert into Branches(BranchName,Location,Manager) values('hdfc','hyderabad','subbu'),
('SBI','kadapa','Naga'),
('canara','proddutur','Manju'),
('karur vysya','tirupati','kavya'),
('Andhra','jammalamadugu','vasu');
select * from Branches;
CREATE TABLE Accounts (
    AccountNumber INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20), 
    Balance DECIMAL(15, 2),
    BranchID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
INSERT INTO Accounts (AccountNumber, CustomerID, AccountType, Balance, BranchID)
VALUES (123456789, 1, 'Savings', 5000.00, 1),
 (45464546, 2, 'currents', 10000.00, 2),
(968696869, 3, 'Savings', 15000.00, 3),
(526352635, 4, 'current', 55000.00, 4),
(858585858, 5, 'Savings', 58000.00, 5);
select * from Accounts;
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber INT,
    TransactionType VARCHAR(10), -- E.g., 'Deposit', 'Withdraw'
    Amount DECIMAL(15, 2),
    TransactionDate DATE,
    FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);
insert into Transactions (AccountNumber,TransactionType,Amount,TransactionDate) values(123456789,'Deposit',5000.00,'2022-09-13'),
(45464546,'Deposit',5500.00,'2024-10-18'),
(968696869,'Withdraw',1500.00,'2023-11-27'),
(526352635,'Deposit',5200.00,'2021-07-09'),
(858585858,'withdraw',2300.00,'2020-09-09');
select * from Transactions;
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    LoanAmount DECIMAL(15, 2),
    LoanType VARCHAR(20), -- E.g., 'Home', 'Car', 'Personal'
    RepaymentSchedule VARCHAR(50), -- E.g., 'Monthly', 'Quarterly'
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
insert into Loans(LoanAmount,LoanType,RepaymentSchedule)
 values(35000.00,'Home','Monthly'),
 (500000.00,'car','Quarterly'),
 (75000.00,'education','Monthly'),
 (130000.00,'Home','Quarterly'),
 (150000.00,'crops','Monthly');
 select * from Loans;
 
 -- Get customers by name
 SELECT * FROM Customers WHERE FirstName = 'John' AND LastName = 'Doe';
 
 -- Get customers with phone numbers starting with a specific number
 SELECT * FROM Customers WHERE PhoneNumber LIKE '987%';
 
 -- Get accounts with a specific account type
 SELECT * FROM Accounts WHERE AccountType = 'Savings';
 
 -- Get the total number of accounts
 SELECT COUNT(*) FROM Accounts;

-- Find accounts with a balance exceeding a certain amount
SELECT * FROM Accounts WHERE Balance > 10000.00;
-- Get all transactions for a specific account: 
SELECT * FROM Transactions WHERE AccountNumber = 123456789;

-- Get the total amount deposited in a specific time period:
SELECT SUM(Amount)
FROM Transactions
WHERE TransactionType = 'Deposit'
AND TransactionDate BETWEEN '2023-01-01' AND '2023-12-31';

-- Find the average transaction amount
SELECT AVG(Amount) FROM Transactions;

SELECT * FROM Loans WHERE LoanType = 'Car';

SELECT SUM(LoanAmount) FROM Loans;
SELECT * FROM Loans WHERE RepaymentSchedule = 'Monthly';