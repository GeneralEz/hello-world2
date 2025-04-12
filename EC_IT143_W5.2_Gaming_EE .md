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

