-- Знайти оцінки студентів у окремій групі з певного предмета
SELECT Students.name AS student_name, Grades.grade
FROM Students
JOIN Grades ON Students.id = Grades.student_id
WHERE Students.group_id = <group_id> AND Grades.subject_id = <subject_id>;
