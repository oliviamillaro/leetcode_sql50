# Write your MySQL query statement below
SELECT
    mgr.name
FROM employee emp
JOIN employee mgr ON emp.managerId = mgr.id
GROUP BY mgr.id, mgr.name
HAVING COUNT(emp.id) >= 5;