-- ============================================================
-- 1. CREATE TABLES
-- ============================================================

-- Create Salesman Table
CREATE TABLE Salesman (
    Salesman_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    Comission REAL
);

-- Create Customer Table
CREATE TABLE Customer (
    customer_id TEXT PRIMARY KEY,
    cust_name TEXT,
    city TEXT,
    grade INTEGER,
    Salesman_id TEXT,
    FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);

-- Create Orders Table
CREATE TABLE Orders (
    ord_no TEXT PRIMARY KEY,
    purch_amt REAL,
    ord_date TEXT,
    customer_id TEXT,
    Salesman_id TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);

-- ============================================================
-- 2. INSERT SAMPLE DATA
-- ============================================================

-- Insert Salesmen
INSERT INTO Salesman (Salesman_id, name, city, Comission) VALUES 
    ('5001', 'James Hoog', 'New York', 0.15),
    ('5002', 'Nail Knite', 'Paris', 0.13),
    ('5005', 'Pit Alex', 'London', 0.11),
    ('5006', 'Mc Lyon', 'Paris', 0.14),
    ('5007', 'Paul Adam', 'Rome', 0.13),
    ('5003', 'Lauson Hen', 'San Jose', 0.12);

-- Insert Customers
INSERT INTO Customer (customer_id, cust_name, city, grade, Salesman_id) VALUES 
    ('3002', 'Nick Rimando', 'New York', 100, '5001'),
    ('3007', 'Brad Davis', 'New York', 200, '5001'),
    ('3005', 'Graham Zusi', 'California', 200, '5002'),
    ('3008', 'Julian Green', 'London', 300, '5002'),
    ('3004', 'Fabian Johnson', 'Paris', 300, '5006'),
    ('3009', 'Geoff Cameron', 'Berlin', 100, '5003'),
    ('3003', 'Jozy Altidor', 'Moscow', 200, '5007'),
    ('3001', 'Brad Guzan', 'London', NULL, '5005');

-- Insert Orders
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES 
    ('70001', 150.50, '2012-10-05', '3005', '5002'),
    ('70009', 270.65, '2012-09-10', '3001', '5001'),
    ('70002', 65.26, '2012-10-05', '3002', '5003'),
    ('70004', 110.50, '2012-08-17', '3009', '5007'),
    ('70007', 948.50, '2012-09-10', '3005', '5005'),
    ('70005', 2400.60, '2012-07-27', '3007', '5006');

-- ============================================================
-- 3. JOIN QUERIES & REPORTS
-- ============================================================

-- Match customers and salesmen who are from the same city
SELECT Customer.cust_name, Salesman.name AS salesman_name, Salesman.city 
FROM Customer 
JOIN Salesman ON Customer.city = Salesman.city;

-- Link each customer to their assigned salesman
SELECT Customer.cust_name, Salesman.name AS salesman_name 
FROM Customer 
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id;

-- Show orders where customer city and salesman city are different
SELECT Orders.ord_no, Customer.cust_name, Customer.city AS customer_city, Salesman.city AS salesman_city 
FROM Orders 
JOIN Customer ON Orders.customer_id = Customer.customer_id 
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id 
WHERE Customer.city <> Salesman.city;

-- Show all orders along with customer names
SELECT Orders.ord_no, Customer.cust_name, Orders.purch_amt, Orders.ord_date 
FROM Orders 
JOIN Customer ON Orders.customer_id = Customer.customer_id;

-- ============================================================
-- 4. FILTERED REPORTS (IS NOT NULL & BETWEEN)
-- ============================================================

-- Customers with grades where grade is present (NOT NULL)
SELECT cust_name, grade 
FROM Customer 
WHERE grade IS NOT NULL;

-- Customers + Salesmen where commission lies between 0.12 and 0.14
SELECT Customer.cust_name, Salesman.name AS salesman_name, Salesman.Comission 
FROM Customer 
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id 
WHERE Salesman.Comission BETWEEN 0.12 AND 0.14;

-- Calculate commission amount for orders where customer grade is 200 or more
SELECT Orders.ord_no, Customer.cust_name, Customer.grade, Salesman.Comission AS commission_rate, 
       (Orders.purch_amt * Salesman.Comission) AS calculated_commission 
FROM Orders 
JOIN Customer ON Orders.customer_id = Customer.customer_id 
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id 
WHERE Customer.grade >= 200;

-- ============================================================
-- 5. DATE-BASED QUERY
-- ============================================================

-- Orders placed on a specific date (e.g., 2012-10-05)
SELECT Orders.ord_no, Customer.cust_name, Orders.purch_amt, Orders.ord_date 
FROM Orders 
JOIN Customer ON Orders.customer_id = Customer.customer_id 
WHERE Orders.ord_date = '2012-10-05';