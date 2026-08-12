# Write your MySQL query statement below
WITH ExamCounts AS (
	SELECT
		student_id
		,subject_name
		,COUNT(*) AS actual_count
	FROM examinations
	GROUP BY student_id, subject_name
)
SELECT
	s.student_id
	,s.student_name
	,sj.subject_name
	,COALESCE(e.actual_count, 0) AS attended_exams
FROM students s
CROSS JOIN subjects sj
LEFT JOIN examcounts e
	ON s.student_id = e.student_id
	AND sj.subject_name = e.subject_name
ORDER BY s.student_id ASC, sj.subject_name ASC;