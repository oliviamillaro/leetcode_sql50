# Write your MySQL query statement below
WITH timeout_confirm_counts AS (
    SELECT
        SUM(CASE WHEN action = 'timeout' THEN 1 ELSE 0 END) AS timeout_count
        ,SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirm_count
        ,user_id
    FROM confirmations
    GROUP BY user_id
)
SELECT
    s.user_id
    ,COALESCE(ROUND(confirm_count /(timeout_count + confirm_count), 2), 0)  AS confirmation_rate
FROM signups s
LEFT JOIN timeout_confirm_counts tcc ON s.user_id = tcc.user_id;