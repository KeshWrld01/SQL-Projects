-- 1. Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INTEGER PRIMARY KEY,
    CUSTOMER_NAME TEXT NOT NULL,
    CITY TEXT NOT NULL,
    COUNTRY TEXT NOT NULL
);

-- 2. Create the PRODUCT_EXPORT table
CREATE TABLE  PRODUCT_EXPORT (
    PRODUCT_ID INTEGER PRIMARY KEY,
    PRODUCT_NAME TEXT NOT NULL,
    CATEGORY TEXT NOT NULL,
    PRICE REAL NOT NULL,
    CUSTOMER_ID INTEGER,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

-- 3. Insert sample customer records
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, CITY, COUNTRY) VALUES
    (1, 'Aaron Miller', 'New York', 'USA'),
    (2, 'Jordan Smith', 'Toronto', 'Canada'),
    (3, 'Amanda Ford', 'London', 'UK'),
    (4, 'George Brown', 'Sydney', 'Australia'),
    (5, 'Adam Taylor', 'Berlin', 'Germany'),
    (6, 'Eleanor Vance', 'Paris', 'France');

-- 4. Insert sample exported product records
INSERT INTO PRODUCT_EXPORT (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE, CUSTOMER_ID) VALUES
    (101, 'Laptop Pro', 'Electronics', 1200.00, 1),
    (102, 'Wireless Mouse', 'Accessories', 25.50, 1),
    (103, 'Monitor 4K', 'Electronics', 450.00, 2),
    (104, 'Mechanical Keyboard', 'Accessories', 110.00, 3),
    (105, 'USB-C Hub', 'Accessories', 45.00, 4),
    (106, 'Ergonomic Chair', 'Furniture', 320.00, 5);

-- ============================================================
-- QUERIES FOR HARISH'S ANALYSIS
-- ============================================================

-- 1. Customers whose name starts with 'a' or 'A'
SELECT * FROM CUSTOMER 
WHERE CUSTOMER_NAME LIKE 'a%' OR CUSTOMER_NAME LIKE 'A%';

-- 2. Customers whose name contains 'or' (case-insensitive search pattern)
SELECT * FROM CUSTOMER 
WHERE CUSTOMER_NAME LIKE '%or%' OR CUSTOMER_NAME LIKE '%OR%';

-- 3. Distinct list of countries products are exported to
SELECT DISTINCT COUNTRY 
FROM CUSTOMER;

-- 4. Customer details along with their exported products and destination countries
SELECT 
    C.CUSTOMER_NAME,
    C.CITY,
    C.COUNTRY AS EXPORT_DESTINATION,
    P.PRODUCT_NAME,
    P.CATEGORY,
    P.PRICE
FROM CUSTOMER C
JOIN PRODUCT_EXPORT P ON C.CUSTOMER_ID = P.CUSTOMER_ID
ORDER BY C.CUSTOMER_NAME ASC;

-- 5. Total number of exported products grouped by destination country
SELECT 
    C.COUNTRY, 
    COUNT(P.PRODUCT_ID) AS TOTAL_PRODUCTS_EXPORTED,
    SUM(P.PRICE) AS TOTAL_EXPORT_VALUE
FROM CUSTOMER C
JOIN PRODUCT_EXPORT P ON C.CUSTOMER_ID = P.CUSTOMER_ID
GROUP BY C.COUNTRY
ORDER BY TOTAL_EXPORT_VALUE DESC;