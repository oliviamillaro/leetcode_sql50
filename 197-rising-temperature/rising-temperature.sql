# Write your MySQL query statement below
SELECT w.id
FROM weather w
JOIN weather w2 ON DATEDIFF(w.recordDate, w2.recordDate) = 1
WHERE w.temperature > w2.temperature;