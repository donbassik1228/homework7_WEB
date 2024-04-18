-- Знайти список студентів у певній групі
SELECT Students.name AS student_name
FROM Students
WHERE Students.group_id = <group_id>;
