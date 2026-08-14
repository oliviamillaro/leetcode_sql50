# Write your MySQL query statement below
WITH user_count AS (
    SELECT
        COUNt(DISTINCT user_id) AS total_users
    FROM users
)
SELECT
    contest_id
    ,ROUND((COUNT(r.user_id) / u.total_users * 100), 2) AS percentage
FROM register r
CROSS JOIN user_count u
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;