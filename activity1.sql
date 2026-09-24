CREATE TABLE SUPLIER (
    SNO TEXT PRIMARY KEY,
    SNAME TEXT,
    STATUS INTEGER,
    CITY TEXT
);

INSERT INTO SUPLIER (SNO, SNAME, STATUS, CITY) VALUES
("S1","John", 21, "London"),
("S2", "Alex", 34, "Paris"),
("S3", "Jones", 35, "Paris"),
("S4", "Smith", 45, "Athens");

SELECT * FROM SUPLIER