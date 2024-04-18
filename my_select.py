from sqlalchemy import func
from models import Student, Grade, Subject, Group, Teacher, session

# Запит №1: Знайти 5 студентів із найбільшим середнім балом з усіх предметів
def select_1():
    result = session.query(Student.fullname, func.round(func.avg(Grade.grade), 2).label('avg_grade')) \
        .select_from(Grade).join(Student).group_by(Student.id).order_by(func.avg(Grade.grade).desc()).limit(5).all()
    return result

# Запит №2: Знайти студента із найвищим середнім балом з певного предмета
def select_2(subject_name):
    result = session.query(Student.fullname, func.round(func.avg(Grade.grade), 2).label('avg_grade')) \
        .join(Grade).join(Subject) \
        .filter(Subject.name == subject_name) \
        .group_by(Student.id).order_by(func.avg(Grade.grade).desc()).first()
    return result

# Запит №3: Знайти середній бал у групах з певного предмета
def select_3(subject_name):
    result = session.query(Group.name, func.round(func.avg(Grade.grade), 2).label('avg_grade')) \
        .join(Student).join(Grade).join(Subject) \
        .filter(Subject.name == subject_name) \
        .group_by(Group.name).order_by(func.avg(Grade.grade).desc()).all()
    return result

# Запит №4: Знайти середній бал на потоці (по всій таблиці оцінок)
def select_4():
    result = session.query(func.round(func.avg(Grade.grade), 2).label('avg_grade')).one()
    return result

# Запит №5: Знайти які курси читає певний викладач
def select_5(teacher_name):
    result = session.query(Subject.name).join(Teacher).filter(Teacher.name == teacher_name).all()
    return result

# Запит №6: Знайти список студентів у певній групі
def select_6(group_name):
    result = session.query(Student.fullname).join(Group).filter(Group.name == group_name).all()
    return result

# Запит №7: Знайти оцінки студентів у окремій групі з певного предмета
def select_7(group_name, subject_name):
    result = session.query(Student.fullname, Grade.grade).join(Group).join(Subject).join(Grade) \
        .filter(Group.name == group_name, Subject.name == subject_name).all()
    return result

# Запит №8: Знайти середній бал, який ставить певний викладач зі своїх предметів
def select_8(teacher_name):
    result = session.query(func.round(func.avg(Grade.grade), 2).label('avg_grade')) \
        .join(Subject).join(Teacher).filter(Teacher.name == teacher_name).one()
    return result

# Запит №9: Знайти список курсів, які відвідує певний студент
def select_9(student_name):
    result = session.query(Subject.name).join(Grade).join(Student).filter(Student.fullname == student_name).all()
    return result

# Запит №10: Список курсів, які певному студенту читає певний викладач
def select_10(student_name, teacher_name):
    result = session.query(Subject.name).join(Grade).join(Student).join(Teacher) \
        .filter(Student.fullname == student_name, Teacher.name == teacher_name).all()
    return result

# Приклад виклику запитів
if __name__ == "__main__":
    result_1 = select_1()
    result_2 = select_2('Math')
    result_3 = select_3('Math')
    result_4 = select_4()
    result_5 = select_5('John Doe')
    result_6 = select_6('Group 1')
    result_7 = select_7('Group 1', 'Math')
    result_8 = select_8('John Doe')
    result_9 = select_9('John Smith')
    result_10 = select_10('John Smith', 'John Doe')

    print("Result 1:", result_1)
    print("Result 2:", result_2)
    print("Result 3:", result_3)
    print("Result 4:", result_4)
    print("Result 5:", result_5)
    print("Result 6:", result_6)
    print("Result 7:", result_7)
    print("Result 8:", result_8)
    print("Result 9:", result_9)
    print("Result 10:", result_10)
