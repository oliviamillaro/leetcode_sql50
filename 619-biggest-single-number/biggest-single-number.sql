# Write your MySQL query statement below
WITH entry_count AS (
    SELECT
        num
    FROM mynumbers
    GROUP BY num
    HAVING count(num) = 1
)
SELECT
    MAX(num) AS num
FROM entry_count;