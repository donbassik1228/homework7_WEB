-- Знайти список курсів, які відвідує студент
SELECT Subjects.name AS subject_name
FROM Subjects
JOIN Grades ON Subjects.id = Grades.subject_id
JOIN Students ON Grades.student_id = Students.id
WHERE Students.name = '<student_name>';
