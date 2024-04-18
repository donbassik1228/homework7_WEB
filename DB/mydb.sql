-- Створення таблиці студентів
CREATE TABLE Students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);

-- Створення таблиці груп
CREATE TABLE Groups (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- Створення таблиці викладачів
CREATE TABLE Teachers (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- Створення таблиці предметів
CREATE TABLE Subjects (
    id INTEGER PRIMARY KEY,
    name TEXT,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

-- Створення таблиці оцінок
CREATE TABLE Grades (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    date_received TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);


-- Додавання даних до таблиці груп
INSERT INTO Groups (name) VALUES
    ('Group 1'),
    ('Group 2'),
    ('Group 3');

-- Додавання даних до таблиці викладачів
INSERT INTO Teachers (name) VALUES
    ('Teacher 1'),
    ('Teacher 2'),
    ('Teacher 3');

-- Додавання даних до таблиці предметів
INSERT INTO Subjects (name, teacher_id) VALUES
    ('Math', 1),
    ('English', 2),
    ('Science', 3),
    ('History', 1),
    ('Art', 2);

-- Додавання даних до таблиці студентів
INSERT INTO Students (name, group_id) VALUES
    ('John Doe', 1),
    ('Jane Smith', 1),
    ('Michael Johnson', 2),
    ('Emily Williams', 2),
    ('Christopher Brown', 3),
    ('Amanda Jones', 3),
    ('Matthew Wilson', 1),
    ('Emma Anderson', 1),
    ('Daniel Taylor', 2),
    ('Olivia Martinez', 2),
    ('Alexander Thomas', 3),
    ('Sophia White', 3),
    ('William Harris', 1),
    ('Isabella Jackson', 1),
    ('David Nelson', 2),
    ('Madison Baker', 2),
    ('Andrew Thompson', 3),
    ('Abigail Adams', 3),
    ('James Robinson', 1),
    ('Mia Clark', 1),
    ('Joseph Lewis', 2),
    ('Grace King', 2),
    ('Benjamin Walker', 3),
    ('Chloe Wright', 3),
    ('Johnston Reed', 1),
    ('Emily Hill', 1),
    ('Gabriel Scott', 2),
    ('Hannah Green', 2),
    ('Lucas Phillips', 3),
    ('Ava Murphy', 3);

-- Додавання даних до таблиці оцінок
INSERT INTO Grades (student_id, subject_id, grade, date_received) VALUES
    (1, 1, 90, '2024-04-20'),
    (2, 2, 85, '2024-04-21'),
    (3, 3, 88, '2024-04-22'),
    (4, 4, 92, '2024-04-23'),
    (5, 5, 78, '2024-04-24'),
    (6, 1, 95, '2024-04-25'),
    (7, 2, 80, '2024-04-26'),
    (8, 3, 85, '2024-04-27'),
    (9, 4, 90, '2024-04-28'),
    (10, 5, 75, '2024-04-29');
