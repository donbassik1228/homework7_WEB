-- Знайти які курси читає певний викладач
SELECT Subjects.name AS subject_name
FROM Subjects
WHERE Subjects.teacher_id = <teacher_id>;
