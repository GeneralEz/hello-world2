-- Query 1 before index
SELECT * FROM Person.Person
WHERE LastName = 'Smith';

-- Execution Plan enabled to generate Missing Index Recommendation
-- (Right-click and enable "Include Actual Execution Plan")

-- Index Recommendation
CREATE NONCLUSTERED INDEX IX_LastName
ON Person.Person(LastName);

-- Query 1 after index
SELECT * FROM Person.Person
WHERE LastName = 'Smith';


-- Query 2 before index
SELECT * FROM Sales.Customer
WHERE CompanyName = 'Bike World';

-- Recommended Index
CREATE NONCLUSTERED INDEX IX_CompanyName
ON Sales.Customer(CompanyName);

-- Query 2 after index
SELECT * FROM Sales.Customer
WHERE CompanyName = 'Bike World';
