-- Знайти середній бал, який ставить певний викладач зі своїх предметів 
SELECT Teachers.name AS teacher_name, AVG(Grades.grade) AS avg_grade
FROM Teachers
JOIN Subjects ON Teachers.id = Subjects.teacher_id
JOIN Grades ON Subjects.id = Grades.subject_id
GROUP BY Teachers.name;

