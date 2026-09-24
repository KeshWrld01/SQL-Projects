-- 1. Create the COMMUNITY_ACTIVITY table
CREATE TABLE COMMUNITY_ACTIVITY (
    ACTIVITY_ID INTEGER PRIMARY KEY,
    ACTIVITY_NAME TEXT NOT NULL,
    ACTIVITY_TYPE TEXT NOT NULL,
    PARTICIPANTS INTEGER NOT NULL,
    FEE_USD REAL NOT NULL,
    DURATION_MINS INTEGER NOT NULL
);

-- 2. Insert sample community center activities
INSERT INTO COMMUNITY_ACTIVITY VALUES (1, 'Beginner Yoga', 'Fitness', 25, 10.0, 60);
INSERT INTO COMMUNITY_ACTIVITY VALUES (2, 'Zumba Dance', 'Fitness', 30, 12.0, 45);
INSERT INTO COMMUNITY_ACTIVITY VALUES (3, 'Watercolor Painting', 'Arts', 12, 25.0, 90);
INSERT INTO COMMUNITY_ACTIVITY VALUES (4, 'Pottery Workshop', 'Arts', 10, 30.0, 120);
INSERT INTO COMMUNITY_ACTIVITY VALUES (5, 'Chess Club', 'Recreation', 18, 5.0, 60);
INSERT INTO COMMUNITY_ACTIVITY VALUES (6, 'Robotics Workshop', 'STEM', 15, 35.0, 90);
INSERT INTO COMMUNITY_ACTIVITY VALUES (7, 'HIIT Workout', 'Fitness', 20, 15.0, 45);
INSERT INTO COMMUNITY_ACTIVITY VALUES (8, 'Creative Writing', 'Arts', 8, 20.0, 60);

-- Display initial table records
SELECT * FROM COMMUNITY_ACTIVITY;

-- 3. Sorting with ORDER BY
-- Sort activities by fee from lowest to highest
SELECT ACTIVITY_NAME, FEE_USD 
FROM COMMUNITY_ACTIVITY 
ORDER BY FEE_USD ASC;

-- Sort activities by participants from highest to lowest
SELECT ACTIVITY_NAME, PARTICIPANTS 
FROM COMMUNITY_ACTIVITY 
ORDER BY PARTICIPANTS DESC;

-- Sort by type alphabetically, then by fee highest first within each type
SELECT ACTIVITY_NAME, ACTIVITY_TYPE, FEE_USD 
FROM COMMUNITY_ACTIVITY 
ORDER BY ACTIVITY_TYPE ASC, FEE_USD DESC;

-- 4. Restricting results with LIMIT
-- Top 3 most attended activities
SELECT ACTIVITY_NAME, PARTICIPANTS 
FROM COMMUNITY_ACTIVITY 
ORDER BY PARTICIPANTS DESC LIMIT 3;

-- Top 3 most expensive activities
SELECT ACTIVITY_NAME, FEE_USD 
FROM COMMUNITY_ACTIVITY 
ORDER BY FEE_USD DESC 
LIMIT 3;

-- 5. Grouping with GROUP BY & Aggregate Functions
-- Count total activities per activity type
SELECT ACTIVITY_TYPE, COUNT(*) AS TOTAL_ACTIVITIES 
FROM COMMUNITY_ACTIVITY 
GROUP BY ACTIVITY_TYPE;

-- Calculate total participants and average fee per activity type
SELECT 
    ACTIVITY_TYPE, 
    SUM(PARTICIPANTS) AS TOTAL_PARTICIPANTS, 
    AVG(FEE_USD) AS AVG_FEE 
FROM COMMUNITY_ACTIVITY 
GROUP BY ACTIVITY_TYPE;

-- 6. Group filtering with HAVING
-- Find activity types with more than 2 activities offered
SELECT ACTIVITY_TYPE, COUNT(*) AS TOTAL_ACTIVITIES 
FROM COMMUNITY_ACTIVITY 
GROUP BY ACTIVITY_TYPE 
HAVING COUNT(*) > 2;

-- Find activity types with an average participant fee above $15.00
SELECT ACTIVITY_TYPE, AVG(FEE_USD) AS AVG_FEE 
FROM COMMUNITY_ACTIVITY 
GROUP BY ACTIVITY_TYPE 
HAVING AVG(FEE_USD) > 15.0;