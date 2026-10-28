# Write your MySQL query statement below
SELECT
    ml.product_id
    ,COALESCE(new_price,10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM products
) AS ml
LEFT JOIN (
    SELECT product_id, new_price
    FROM products
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date)
        FROM products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ) 
) AS vp
ON ml.product_id = vp.product_id
ORDER BY ml.product_id ASC;