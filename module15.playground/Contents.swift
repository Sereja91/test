import UIKit

//1 Создание перечисления для ошибок и добавление 3х кейсов. Создание переменных, которые хранят в себе ошибки. Обработка ошибок перечисления при помощи do-catch.
enum ServerError: Error {
    case error400
    case error404
    case error500
}

var error400: Bool = false
var error404: Bool = true
var error500: Bool = false

do {
    if error400 {
        throw ServerError.error400
    }
    if error404 {
        throw ServerError.error404
    }
    if error500 {
        throw ServerError.error500
    }
} catch ServerError.error400 {
    print ("Error 400: Bad Request")
} catch ServerError.error404 {
    print ("Error 404: Not Found")
} catch ServerError.error500 {
    print ("Error 500: Internal Server Error")
}

//2 Добавление проверки переменных в генерирующую функцию и ее обработка.

func identificationOfError() throws {
    if error400 {
        throw ServerError.error400
    }
    if error404 {
        throw ServerError.error404
    }
    if error500 {
        throw ServerError.error500
    }
}

do {
   try identificationOfError()
} catch ServerError.error400 {
    print ("Error 400: Bad Request")
} catch ServerError.error404 {
    print ("Error 404: Not Found")
} catch ServerError.error500 {
    print ("Error 500: Internal Server Error")
}

//3 Написание функции, которая принимает на вход два разных типа с последующей проверкой. "Yes" - типы входных значений одинаковые, "No" - типы входных значений разные.

func checkOfTheTypesFirst <T,E> (firstParament: T, secondParametr: E) {
    if type(of: firstParament) == type(of: secondParametr) {
        print ("Yes")
    } else {
        print ("No")
    }
}
checkOfTheTypesFirst (firstParament: 3, secondParametr: "3")
checkOfTheTypesFirst (firstParament: 3, secondParametr: 3)
checkOfTheTypesFirst (firstParament: 3, secondParametr: 3.0)

//4 Написание функции, которая принимает на вход два разных типа. Если типы одинаковые, то необходимо выбросить исключение и информировать, что типы одинаковые. Если типы разные, то необходимо выборосить исключение и информировать, что типы разные.

func checkOfTheTypesSecond <T,E> (parametrOne: T, parametrTwo: E) -> Bool {
    return type(of: parametrOne) == type(of: parametrTwo)
}

let resultOfCheck = checkOfTheTypesSecond(parametrOne: 3, parametrTwo: "3")
var hasSameType: Bool = false
var hasDifferentType: Bool = false

if resultOfCheck == true {
    hasSameType = true
} else {
    hasDifferentType = true
}

enum VariantsOfType: Error {
    case hasSameType
    case hasDifferentType
}

func chooseVariantOfType () throws {
    if hasSameType {
        throw VariantsOfType.hasSameType
    }
    if hasDifferentType {
        throw VariantsOfType.hasDifferentType
    }
}

do {
    try chooseVariantOfType()
} catch VariantsOfType.hasSameType {
    print ("Same types")
} catch VariantsOfType.hasDifferentType {
    print ("Different types")
}

//5 Написание функции, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==

func equal <T: Equatable> (firstValue: T, secondValue: T) -> Bool {
    return firstValue == secondValue
}
print (equal(firstValue: 3, secondValue: 3))
print (equal(firstValue: 3, secondValue: 5))
print (equal(firstValue: "a", secondValue: "b"))
print (equal(firstValue: "a", secondValue: "a"))
