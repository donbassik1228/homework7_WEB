-- Знайти середній бал у групах з певного предмета
SELECT Groups.name AS group_name, AVG(grade) AS avg_grade
FROM Grades
JOIN Students ON Grades.student_id = Students.id
JOIN Groups ON Students.group_id = Groups.id
WHERE Grades.subject_id = <subject_id>
GROUP BY Groups.name;
