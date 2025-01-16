-- 5-Sorting and Grouping data

#CREATING THE DATABASE AS POPULATION TABLE

CREATE DATABASE POPULATIONTABLE;

#USING THE DATABASE POPULATION TABLE

USE POPULATIONTABLE;

-- Insert 10 rows into both tables, as given below. 

-- Create a table named Country with fields: Id, Country_name, Population and Area

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);
-- Create another table named Persons with fields: Id, Fname, Lname, Population, Rating, Country_Id and Country_name

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

# INSERTING DATA INTO Country TABLE
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
	(1, 'USA', 331000000, 9833517),
	(2, 'Canada', 37742154, 9984670),
	(3, 'India', 1380004385, 3287263),
	(4, 'Australia', 25687041, 7692024),
	(5, 'UK', 67886011, 243610),
	(6, 'Germany', 83783942, 357022),
	(7, 'France', 67081000, 551695),
	(8, 'Italy', 60265000, 301340),
	(9, 'Japan', 126476461, 377975),
	(10, 'Mexico', 128933000, 1964375)
;

# INSERTING DATA INTO Persons TABLE
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
	(1, 'John', 'Doe', 200000, 4.2, 1, 'USA'),
	(2, 'Alice', 'Smith', 300000, 4.5, 2, 'Canada'),
	(3, 'Bob', 'Johnson', 130000, 3.8, 3, 'India'),
	(4, 'Charlie', 'Brown', 350000, 4.9, 4, 'Australia'),
	(5, 'Daisy', 'White', 300000, 3.5, 5, 'UK'),
	(6, 'Eve', 'Davis', 300000, 4.1, 6, 'Germany'),
	(7, 'Frank', 'Miller', 300000, 4.8, 7, 'France'),
	(8, 'Grace', 'Wilson', 400000, 4.3, 8, 'Italy'),
	(9, 'Hank', 'Moore', 600000, 5.0, 9, 'Japan'),
	(10, 'James', 'Bond', 700000, 4.6, 10, 'Mexico'),
	(11, 'Sasi', null, 100000, 4.2, 1, 'USA'),
	(12, 'Taylor', 'Smith', 300000, 4.5, 2, 'Canada'),
	(13, 'Baby', null, 150000, 3.8, 3, 'India'),
	(14, 'Chareles', null, 350000, 4.9, 4, 'Australia'),
	(15, 'Jessy', 'White', 400000, 3.5, 5, 'UK'),
	(16, 'Ram', 'Ramesh', 450000, 4.1, 6, 'Germany'),
	(17, 'Killer', 'Miller', 300000, 4.8, 7, 'France'),
	(18, 'James', null, 400000, 4.3, 8, 'Italy'),
	(19, 'Tom', null, 600000, 5.0, 9, 'Japan'),
	(20, 'Freddy', null, 700000, 4.6, 10, 'Mexico')
;

-- To view the data insid ethe table

SELECT * FROM Country;
SELECT * FROM Persons;

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.

SELECT LEFT(Country_name, 3) AS Country_name_first_three_chars
FROM Country;

SELECT LEFT(Country_name, 3) FROM Country;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.

SELECT CONCAT(Fname, ' ', Lname) FROM Persons;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM Persons;

-- 3. Write an SQL query to count the number of unique country names from Persons table.

SELECT COUNT(DISTINCT Country_name) FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count
FROM Persons;

-- 4. Write a query to print the maximum population from the Country table.

SELECT MAX(Population) FROM Country;

SELECT MAX(Population) AS Max_Population
FROM Country;

-- 5. Write a query to print the minimum population from Persons table.

SELECT MIN(Population) FROM Persons;

SELECT MIN(Population) AS Min_Population
FROM Persons;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(21, 'Jane', NULL, 250000, 4.3, 3, 'India'),
(22, 'Sam', NULL, 150000, 3.9, 10, 'Mexico');

SELECT COUNT(Lname) AS Lname_Count
FROM Persons;

SELECT COUNT(Lname) AS Lname_Count
FROM Persons
WHERE Lname IS NOT NULL;

-- 7. Write a query to find the number of rows in the Persons table.

SELECT COUNT(*) FROM Persons;

SELECT COUNT(*) AS Total_Rows
FROM Persons;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)

SELECT Population FROM Country LIMIT 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order.

SELECT * FROM Persons ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table.

SELECT Country_name, SUM(Population)
FROM Persons
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000

SELECT Country_name, SUM(Population)
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

SELECT Country_name, COUNT(Id), AVG(Rating)
FROM Persons
GROUP BY Country_name
HAVING COUNT(Id) > 2
ORDER BY AVG(Rating) ASC;

SELECT Country_name, COUNT(Id) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(Id) > 2
ORDER BY AVG(Rating) ASC;