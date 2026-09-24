-- 1. Create the PRODUCT table
CREATE TABLE PRODUCT (
    PRO_ID TEXT PRIMARY KEY,
    PRO_NAME TEXT NOT NULL,
    PRO_PRICE REAL NOT NULL,
    PRO_COM TEXT
);

-- 2. Insert sample inventory items
INSERT INTO PRODUCT (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) 
VALUES 
    ('101', 'MOTHER BOARD', 3200, '15'),
    ('102', 'KEY BOARD', 450, '16'),
    ('103', 'ZIP DRIVE', 250, '14'),
    ('104', 'SPEAKER', 550, '16'),
    ('105', 'MONITOR', 5000, '11'),
    ('106', 'DVD DRIVE', 900, '12'),
    ('107', 'CD DRIVE', 800, '12'),
    ('108', 'PRINTER', 2600, '13'),
    ('109', 'REFILL CARTRIDGE', 350, '13'),
    ('110', 'MOUSE', 250, '12');

-- 3. COUNT: Calculate total number of products in stock
SELECT COUNT(*) AS TOTAL_PRODUCTS 
FROM PRODUCT;

-- 4. SUM: Calculate total monetary value of all inventory combined
SELECT SUM(PRO_PRICE) AS TOTAL_INVENTORY_VALUE 
FROM PRODUCT;

-- 5. AVG: Calculate the average product price across the entire inventory
SELECT AVG(PRO_PRICE) AS AVERAGE_PRICE 
FROM PRODUCT;

-- 6. MIN & MAX: Find the cheapest and most expensive items
SELECT MIN(PRO_PRICE) AS CHEAPEST_PRICE, MAX(PRO_PRICE) AS MOST_EXPENSIVE_PRICE 
FROM PRODUCT;

-- 7. Filtered Aggregation: Find average price for items from Company '12'
SELECT AVG(PRO_PRICE) AS AVG_PRICE_COMPANY_12 
FROM PRODUCT 
WHERE PRO_COM = '12';