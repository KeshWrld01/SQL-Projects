-- 1. Create the Department/Employee table
CREATE TABLE DEPARTMENT (
    EMPLOYEE_ID TEXT PRIMARY KEY,
    NAME TEXT,
    COMPANY TEXT,
    ROLE TEXT,
    SALARY REAL
);
-- 2. Insert sample records into the table
INSERT INTO DEPARTMENT (EMPLOYEE_ID, NAME, COMPANY, ROLE, SALARY)
VALUES ('E101', 'Tarun', 'DXC', 'Manager', 85000),
    ('E102', 'Rohan', 'DXC', 'Developer', 60000),
    ('E103', 'Ananya', 'Infosys', 'Analyst', 55000),
    ('E104', 'Vikram', 'DXC', 'Tester', 48000),
    ('E105', 'Priya', 'TCS', 'Developer', 62000);
-- 3. Display all records from the table
SELECT *
FROM DEPARTMENT;
-- 4. Fetch details of employees specifically working for DXC
SELECT *
FROM DEPARTMENT
WHERE COMPANY = 'DXC';
-- 5. Fetch specific employee details by ID or Name (e.g., Tarun)
SELECT NAME,
    ROLE,
    SALARY
FROM DEPARTMENT
WHERE NAME = 'Tarun';