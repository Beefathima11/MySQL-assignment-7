Create database assignment_7;
use assignment_7;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(100)
);
INSERT INTO Country (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Smith', 5000000, 4.5, 101, 'United States'),
(2, 'Emma', 'Johnson', 3500000, 4.2, 102, 'Canada'),
(3, 'Liam', 'Williams', 8500000, 4.7, 103, 'United Kingdom'),
(4, 'Olivia', 'Brown', 2500000, 4.0, 104, 'Australia'),
(5, 'Noah', 'Davis', 4500000, 4.3, 105, 'New Zealand'),
(6, 'Sophia', 'Wilson', 12000000, 4.8, 106, 'India'),
(7, 'James', 'Moore', 8000000, 4.6, 107, 'Germany'),
(8, 'Isabella', 'Taylor', 7000000, 4.4, 108, 'France'),
(9, 'Elijah', 'Anderson', 6000000, 4.1, 109, 'Japan'),
(10, 'Mia', 'Thomas', 4000000, 4.0, 110, 'Italy');

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(100)
);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Smith', 5000000, 4.5, 101, 'United States'),
(2, 'Emma', 'Johnson', 3500000, 4.2, 102, 'Canada'),
(3, 'Liam', 'Williams', 8500000, 4.7, 103, 'United Kingdom'),
(4, 'Olivia', 'Brown', 2500000, 4.0, 104, 'Australia'),
(5, 'Noah', 'Davis', 4500000, 4.3, 105, 'New Zealand'),
(6, 'Sophia', 'Wilson', 12000000, 4.8, 106, 'India'),
(7, 'James', 'Moore', 8000000, 4.6, 107, 'Germany'),
(8, 'Isabella', 'Taylor', 7000000, 4.4, 108, 'France'),
(9, 'Elijah', 'Anderson', 6000000, 4.1, 109, 'Japan'),
(10, 'Mia', 'Thomas', 4000000, 4.0, 110, 'Italy');

ALTER TABLE Persons ADD DOB DATE;

DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN Age;
END //

DELIMITER ;

UPDATE Persons
SET DOB = CASE
    WHEN Id = 1 THEN '1990-01-15'
    WHEN Id = 2 THEN '1985-06-22'
    WHEN Id = 3 THEN '1992-09-10'
    WHEN Id = 4 THEN '1995-03-05'
    WHEN Id = 5 THEN '1988-11-17'
    WHEN Id = 6 THEN '1980-07-25'
    WHEN Id = 7 THEN '1975-12-12'
    WHEN Id = 8 THEN '1998-08-30'
    WHEN Id = 9 THEN '2000-05-20'
    WHEN Id = 10 THEN '1993-02-14'
END;
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;
SELECT Country_name, CHAR_LENGTH(Country_name) AS NameLength
FROM Country;

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

SELECT 
    Country_name, 
    UPPER(Country_name) AS UppercaseName, 
    LOWER(Country_name) AS LowercaseName
FROM Country;

