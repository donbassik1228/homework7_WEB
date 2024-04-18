-- Список курсів, які певному студенту читає певний викладач 
SELECT Subjects.name AS subject_name
FROM Subjects
JOIN Grades ON Subjects.id = Grades.subject_id
JOIN Students ON Grades.student_id = Students.id
JOIN Teachers ON Subjects.teacher_id = Teachers.id
WHERE Students.name = '<student_name>' AND Teachers.name = '<teacher_name>';
