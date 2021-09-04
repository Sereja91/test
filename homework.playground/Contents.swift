import UIKit

//1. Создание кортежей для двух человек с одинаковыми типами данных и параметрами. Для firstPerson получаем значения по индексу, а для secondPerson получаем значения по параметру.
let firstPerson = (name: "Roman", height: 180, weight: 80)
let secondPerson = (name: "Misha", height: 175, weight: 75)

firstPerson.0
firstPerson.1
firstPerson.2

secondPerson.name
secondPerson.height
secondPerson.weight

//2. Создание массива "дни в месяцах"
let countDaysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

//2.1 Выведение количества дней в каждом месяце.
for days in countDaysInMonths {
    print (days)
}

//2.2 Создание массива с названием месяцев и выведение названия месяца и количества дней соответственно.
let namesOfMonths = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

for index in 0...11 {
    print ("\(namesOfMonths[index]) consist of \(countDaysInMonths[index]) days")
}

//2.3 Создание массива кортежей и выведение названия месяца и количества дней соответственно из массива кортежей.
let daysAndMonths = [(month: "Январь", day: 31), (month: "Февраль", day: 28), (month: "Март", day: 31), (month: "Апрель", day: 30), (month: "Май", day: 31), (month: "Июнь", day: 30), (month: "Июль", day: 31), (month: "Август", day: 31), (month: "Сентябрь", day: 30), (month: "Октябрь", day: 31), (month: "Ноябрь", day: 30), (month: "Декабрь", day: 31)]

for information in daysAndMonths {
    print (information)
}

//2.4 Выведение дней в обратном порядке.
for value in daysAndMonths.reversed(){
    print ("\(value)")
}

let arrayWithIndex = [11,10,9,8,7,6,5,4,3,2,1,0]
for index in arrayWithIndex {
    print ("\(namesOfMonths[index]) \(countDaysInMonths[index])")
}

//2.5 Выбор произвольной даты и расчет количества дней до конца года.
let randomInt = Int.random(in: 0...11)
let currentMonth = namesOfMonths [randomInt]
let currentDay = Int.random(in: 1...31)
let countDaysInYear = 365
var previosCountDays = 0

switch currentMonth {
case "Январь":
    previosCountDays = 0
case "Февраль":
    previosCountDays = countDaysInMonths.dropLast(11).reduce(0, +)
case "Март":
    previosCountDays = countDaysInMonths.dropLast(10).reduce(0, +)
case "Апрель":
    previosCountDays = countDaysInMonths.dropLast(9).reduce(0, +)
case "Май":
    previosCountDays = countDaysInMonths.dropLast(8).reduce(0, +)
case "Июнь":
    previosCountDays = countDaysInMonths.dropLast(7).reduce(0, +)
case "Июль":
    previosCountDays = countDaysInMonths.dropLast(6).reduce(0, +)
case "Август":
    previosCountDays = countDaysInMonths.dropLast(5).reduce(0, +)
case "Сентябрь":
    previosCountDays = countDaysInMonths.dropLast(4).reduce(0, +)
case "Октябрь":
    previosCountDays = countDaysInMonths.dropLast(3).reduce(0, +)
case "Ноябрь":
    previosCountDays = countDaysInMonths.dropLast(2).reduce(0, +)
case "Декабрь":
    previosCountDays = countDaysInMonths.dropLast(1).reduce(0, +)
default:
    print ("no information")
}

let countDaysForNewYear = countDaysInYear - (previosCountDays + currentDay)
print ("Текущая дата: \(currentMonth) \(currentDay). До нового года осталось: \(countDaysForNewYear) дней (дня)")

//3. Создание словаря. Фамилия и имя студента - это ключ. Оценка на экзамене - значение.
var studentsAndMarks = ["Иванова Ирина" : 5, "Григорьев Роман" : 4, "Гапонов Кирилл" : 2, "Самаркин Евгений" : 1, "Цед Анастасия" : 3]

//3.1 Повышение оценки студенту.
studentsAndMarks ["Гапонов Кирилл"] = 3

//3.2 Выведение сообщения в зависимости от оценки.
for (name, mark) in studentsAndMarks {
    if mark >= 3 {
        print ("\(name) Ваша оценка \(mark), экзамен сдан!")
    } else {
        print ("\(name) Ваша оценка \(mark), Вам необходимо пересдать экзамен!")
    }
}

//3.3 Добавление нескольких студентов.
studentsAndMarks ["Иванов Михаил"] = 5
studentsAndMarks ["Колесникова Валерия"] = 4
print (studentsAndMarks)

//3.4 Удаление одного студента (отчисление).
studentsAndMarks.removeValue(forKey: "Самаркин Евгений")
print (studentsAndMarks)

//3.5 Подсчет среднего балла всей группы по итогам экзамена.
let marksOfStudents = [Int](studentsAndMarks.values)
let averageMark = marksOfStudents.reduce(0, +) / marksOfStudents.count
print ("Средний балл за экзамен у всех студенов: \(averageMark)")
