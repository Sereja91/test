import UIKit

protocol UserData {
    var userName: String {get}
    var userCardNumber: String {get}
    var userCardPin: Int {get}
    var userPhone: String {get}
    var userCash: Int {get set}
    var userBankDeposit: Int {get set}
    var userPhoneBalance: Int {get set}
    var userCardBalance: Int {get set}
}

class User: UserData {
    private (set) var userName: String
    private (set) var userCardNumber: String
    private (set) var userCardPin: Int
    private (set) var userPhone: String
    var userCash: Int
    var userBankDeposit: Int
    var userPhoneBalance: Int
    var userCardBalance: Int
    init (userName: String, userCardNumber: String, userCardPin: Int, userPhone: String, userCash: Int, userBankDeposit: Int, userPhoneBalance: Int, userCardBalance: Int) {
        self.userName = userName
        self.userCardNumber = userCardNumber
        self.userCardPin = userCardPin
        self.userPhone = userPhone
        self.userCash = userCash
        self.userBankDeposit = userBankDeposit
        self.userPhoneBalance = userPhoneBalance
        self.userCardBalance = userCardBalance
    }
}

let user1 = User (userName: "Ivan", userCardNumber: "1111 1111", userCardPin: 1111, userPhone: "8-777-777-77-77", userCash: 10000, userBankDeposit: 15000, userPhoneBalance: 300, userCardBalance: 5000)
let user2 = User (userName: "Semen", userCardNumber: "2222 2222", userCardPin: 2222, userPhone: "8-888-888-88-88", userCash: 5000, userBankDeposit: 10000, userPhoneBalance: 1000, userCardBalance: 12000)
let user3 = User (userName: "Petr", userCardNumber: "3333 3333", userCardPin: 3333, userPhone: "8-999-999-99-99", userCash: 3000, userBankDeposit: 15000, userPhoneBalance: 1500, userCardBalance: 7500)


protocol BankApi {
    func showCardBalance()
    func showBankDeposit()
    func getCashFromCard(cash: Int)
    func getCashFromBankDeposit(cash: Int)
    func putCashOnCard(cash: Int)
    func putCashOnBankDeposit(cash: Int)
    func topUpPhoneBalanceWithCash(pay: Int)
    func topUpPhoneBalanceWithCard(pay: Int)
}

class ATM: BankApi {
    func showCardBalance() {
        print ("Ваш баланс: \(choosenUser.userCardBalance)")
    }
    func showBankDeposit() {
        print ("На Вашем банковском счете: \(choosenUser.userBankDeposit)")
    }
    func getCashFromCard(cash: Int) {
        if cash <= choosenUser.userCardBalance {
            print ("Выдача наличных с карты: \(cash). Остаток на карте: \(choosenUser.userCardBalance - cash)")
        } else {
            print ("\(TextErrors.exceedCardBalance.rawValue). Доступный баланс: \(choosenUser.userCardBalance)")
        }
    }
    func getCashFromBankDeposit(cash: Int) {
        if cash <= choosenUser.userBankDeposit {
        print ("Выдача наличных с банковского счета: \(cash). Остаток на банковском счете: \(choosenUser.userBankDeposit - cash)")
        } else {
            print ("\(TextErrors.exceedBankDeposit.rawValue). Доступный баланс: \(choosenUser.userBankDeposit)")
        }
    }
    func putCashOnCard(cash: Int) {
        print ("Пополнение карты на: \(cash). Баланс на карте: \(choosenUser.userCardBalance + cash)")
    }
    func putCashOnBankDeposit(cash: Int) {
        print ("Пополнение банковского счета на: \(cash). Баланс на банковском счете: \(choosenUser.userBankDeposit + cash)")
    }
    func topUpPhoneBalanceWithCash(pay: Int) {
        print ("Пополнение баланса телефона наличными на сумму: \(pay). Баланс телефона: \(choosenUser.userPhoneBalance + pay)")
    }
    func topUpPhoneBalanceWithCard(pay: Int) {
        print ("Пополнение баланса телефона с карты на сумму: \(pay). Баланс телефона: \(choosenUser.userPhoneBalance + pay)")
    }
}

enum UserActions {
    case showCardBalance
    case showBankDeposit
    case getCashFromCard
    case getCashFromBankDeposit
    case putCashOnCard
    case putCashOnBankDeposit
    case topUpPhoneBalanceWithCash
    case topUpPhoneBalanceWithCard
}

enum DescriptionTypesAvailableOperations: String {
    case showCardBalance = "Выбранная транзакция: баланс на карте"
    case showBankDeposit = "Выбранная транзакция: баланс на банковском счете"
    case getCashFromCard = "Выбранная транзакция: получить наличные"
    case getCashFromBankDeposite = "Выбранная транзакция: получить наличные с банковского счета"
    case putCashOnCard = "Выбранная транзакция: пополнить карту"
    case putCashOnBankDeposite = "Выбранная транзакция: пополнить банковский счет"
    case topUpPhoneBalanceWithCash = "Выбранная транзакция: пополнить телефонный баланс наличными"
    case topUpPhoneBalanceWithCard = "Выбранная транзакция: Пополнить телефонный баланс с карты"
}

enum TextErrors: String {
    case exceedCardBalance = "Недостаточно средств на карте"
    case exceedBankDeposit = "Недостаточно средств на банковском счете"
}


func userAction (action: UserActions) {
    switch action {
    case .showCardBalance:
        print (DescriptionTypesAvailableOperations.showCardBalance.rawValue)
        availableATMFunctions.showCardBalance()
    case .showBankDeposit:
        print (DescriptionTypesAvailableOperations.showBankDeposit.rawValue)
        availableATMFunctions.showBankDeposit()
    case .getCashFromCard:
        print (DescriptionTypesAvailableOperations.getCashFromCard.rawValue)
        availableATMFunctions.getCashFromCard(cash: Int.random(in: 0...(choosenUser.userCardBalance + 1000)))
    case .getCashFromBankDeposit:
        print (DescriptionTypesAvailableOperations.getCashFromBankDeposite.rawValue)
        availableATMFunctions.getCashFromBankDeposit(cash: Int.random(in: 0...(choosenUser.userBankDeposit + 1000)))
    case .putCashOnCard:
        print (DescriptionTypesAvailableOperations.putCashOnCard.rawValue)
        availableATMFunctions.putCashOnCard(cash: Int.random(in: 0...choosenUser.userCash))
    case .putCashOnBankDeposit:
        print (DescriptionTypesAvailableOperations.putCashOnBankDeposite.rawValue)
        availableATMFunctions.putCashOnBankDeposit(cash: Int.random(in: 0...choosenUser.userCash))
    case .topUpPhoneBalanceWithCash:
        print (DescriptionTypesAvailableOperations.topUpPhoneBalanceWithCash.rawValue)
        print ("Пополнение телефонного баланса по номеру \(choosenUser.userPhone)")
        availableATMFunctions.topUpPhoneBalanceWithCash(pay: Int.random(in: 0...choosenUser.userCash))
    case .topUpPhoneBalanceWithCard:
        print (DescriptionTypesAvailableOperations.topUpPhoneBalanceWithCard.rawValue)
        print ("Пополнение телефонного баланса по номеру \(choosenUser.userPhone)")
        availableATMFunctions.topUpPhoneBalanceWithCard(pay: Int.random(in: 0...choosenUser.userCardBalance))

    }
}

func enterPinCode (pinCode: Int) {
    if pinCode == choosenUser.userCardPin {
        print ("Проверка введенного пинкода.\nПинкод введен корректно.\nЗдравствуйте, \(choosenUser.userName)!")
    } else {
        print ("Проверка введенного пинкода.\nНеверный пинкод.")
    }
}


let availableATMFunctions = ATM()
let choosenUser = user3

enterPinCode(pinCode: 3333)
userAction(action: .topUpPhoneBalanceWithCash)

