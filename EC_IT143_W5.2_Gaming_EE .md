-- Question: What is the most popular game played in the community?
-- Author: John D.

SELECT TOP 1 GameName, COUNT(*) AS PlayCount
FROM GameSessions
GROUP BY GameName
ORDER BY PlayCount DESC;


-- Question: How many members have joined in the last year?
-- Author: Me

SELECT COUNT(*) AS NewMembers
FROM Members
WHERE JoinDate >= DATEADD(YEAR, -1, GETDATE());


-- Question: Which platform (PC, Console, Mobile) is used most by members?
-- Author: Me

SELECT Platform, COUNT(*) AS UserCount
FROM MemberPreferences
GROUP BY Platform
ORDER BY UserCount DESC;


-- Question: What is the average session time per game?
-- Author: Me

SELECT GameName, AVG(SessionDuration) AS AvgSessionTime
FROM GameSessions
GROUP BY GameName;

CREATE FUNCTION dbo.GetFirstName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN LEFT(@FullName, CHARINDEX(' ', @FullName + ' ') - 1)
END

ALTER TABLE Employees
ADD LastModifiedDate DATETIME,
    LastModifiedBy NVARCHAR(50);

CREATE TRIGGER trg_UpdateLastModifiedDate
ON Employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Employees
    SET LastModifiedDate = GETDATE()
    FROM Employees E
    INNER JOIN Inserted I ON E.EmployeeID = I.EmployeeID;
END

CREATE TRIGGER trg_UpdateLastModifiedBy
ON Employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Employees
    SET LastModifiedBy = SUSER_SNAME()
    FROM Employees E
    INNER JOIN Inserted I ON E.EmployeeID = I.EmployeeID;
END
