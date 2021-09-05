import UIKit

//1. Объявляем переменную, которая хранит в себе режим управления.
var autopilotIsTurnOn: Bool = true

//2. Объявляем константы с хранением характеристик автомобиля
//Единицы измерения: масса - килограммы; длина, ширина (с учетом боковых зеркал), высота, колесная база, клиренс - миллиметры.; объем багажника - литры; размер колес - дюймы.
let weight = 2108
let length = 4976
let widthWithSideMirrors = 1963
let height = 1435
let wheelbase = 2959
let clearance = 154.9
let trunkVolume = 900

// 2.1 Дополнительные данные (проявление фантазии).
let color = "Black"
let wheelSize = 19
let typeOfcar = "Coupe"

//3. Реализация хранения функционала машины (обязательный функционал).
//3.1 Наличие функции управления музыки и текущая громкость музыки.
var musicControllerIsAvailable: Bool = true
var musicVolume = Int.random (in: 0...100)

//3.2 Наличие люка в машине и на сколько открыт люк.
var sunroofIsAvailable: Bool = true
var sunroofOpenBy = Int.random (in: 0...100)

//3.3 Наличие вентилятора в машине и скорость обдува вентиляторов.
var funIsAvailable: Bool = true
var funSpeed = Int.random (in: 0...3)

//3.4 Наличие климатических установок для водительского сиденья и варианты климатических установок.
var climatOptionsForDriverIsAvailable: Bool = true
var climatOptionsForDriver = Int.random (in: 0...3)

//3.5 Дополнительные функции машины (проявление фантазии).
//3.5.1 Наличие блютуса в машине.
var bluetoothIsAvailable: Bool = true
var bluetoothTurnOn = true

//3.5.2 Наличие беспроводной зарядки.
var wirelessChargerIsAvailable: Bool = true
var wirelessChargerTurnOn = true

//3.5.3 Наличие контроллера уровня масла и текущий уровень масла.
var oilLevelControllerIsAvailable: Bool = true
var oilLevel = Int.random(in: 0...100)

// 4. и 5. Реализация системы обработки ошибок и реализация системы информирования пользователя о состоянии функций автомобиля.
enum AutoError: Error {
    case musicControllerIsBroken
    case sunroofIsBroken
    case funIsBroken
    case climatOptionsIsBroken
    case bluetoothIsBroken
    case wirelessChargerIsBroken
    case oilLevelControllerIsBroken
    case autopilotIsBroken
}

var musicControllerIsBroken: Bool = false
var sunroofIsBroken: Bool = false
var funIsBroken: Bool = false
var climatOptionsIsBroken: Bool = false
var bluetoothIsBroken: Bool = false
var wirelessChargerIsBroken: Bool = false
var oilLevelControllerIsBroken: Bool = false
var autopilotIsBroken: Bool = false

do {
    if musicControllerIsBroken && musicControllerIsAvailable {
        throw AutoError.musicControllerIsBroken
    }

    if sunroofIsBroken && sunroofIsAvailable {
        throw AutoError.sunroofIsBroken
    }
    
    if funIsBroken && funIsAvailable {
        throw AutoError.funIsBroken
    }
    
    if climatOptionsIsBroken && climatOptionsForDriverIsAvailable {
        throw AutoError.climatOptionsIsBroken
    }
    
    if bluetoothIsBroken && bluetoothIsAvailable {
        throw AutoError.bluetoothIsBroken
    }
    
    if wirelessChargerIsBroken && wirelessChargerIsAvailable {
        throw AutoError.wirelessChargerIsBroken
    }
    if oilLevelControllerIsBroken && oilLevelControllerIsAvailable {
        throw AutoError.oilLevelControllerIsBroken
    }
    
    if autopilotIsBroken {
        throw AutoError.autopilotIsBroken
    }
    
} catch AutoError.musicControllerIsBroken {
    print ("Управление музыкой неисправно. Необходимо заехать на СТО")
} catch AutoError.sunroofIsBroken {
    print ("Невозможно открыть люк по причине неисправности. Необходимо заехать на СТО")
} catch AutoError.funIsBroken {
    print ("Вентилятор неисправен. Необходимо заехать на СТО.")
} catch AutoError.climatOptionsIsBroken {
    print ("Климатические настройки для водительского сиденья неисправны. Необходимо заехать на СТО.")
} catch AutoError.bluetoothIsBroken {
    print ("Блютус неисправен. Необходимо заехать на СТО.")
} catch AutoError.wirelessChargerIsBroken {
    print ("Беспроводная зарядка неисправна. Необходимо заехать на СТО.")
} catch AutoError.oilLevelControllerIsBroken {
    print ("Датчик контроля масла неисправен. Необходимо заехать на СТО.")
} catch AutoError.autopilotIsBroken {
    print ("Автопилот неисправен. Необходимо заехать на СТО.")
}

if musicControllerIsBroken == false && musicVolume == 0 && musicControllerIsAvailable {
    print ("Музыка отключена.")
} else if musicControllerIsBroken == false && musicControllerIsAvailable && musicVolume > 0 {
    print ("Громкость музыки: \(musicVolume).")
}

if sunroofIsBroken == false && sunroofOpenBy == 0 && sunroofIsAvailable {
    print ("Люк закрыт.")
} else if sunroofIsBroken == false && sunroofOpenBy > 0 && sunroofIsAvailable {
    print ("Люк открыт на \(sunroofOpenBy) %.")
}

if funIsBroken == false && funSpeed == 0 && funIsAvailable {
    print ("Вентилятор отключен.")
} else if funIsBroken == false && funSpeed > 0 && funIsAvailable {
    print ("Мощность обдува вентилятора: \(funSpeed) уровень.")
}

if climatOptionsIsBroken == false && climatOptionsForDriver == 0 && climatOptionsForDriverIsAvailable {
    print ("Климатические настройки для водительского сиденья отключены.")
} else if climatOptionsIsBroken == false && climatOptionsForDriver > 0 && climatOptionsForDriverIsAvailable {
    print ("Выбраны следующие климатически настройки для водительского сиденья: опция № \(climatOptionsForDriver)")
}

if bluetoothIsBroken == false && bluetoothTurnOn && bluetoothIsAvailable {
    print ("Блютус подключен. Подключите свое устройство.")
} else if bluetoothIsBroken == false && bluetoothTurnOn == false && bluetoothIsAvailable {
    print ("Блютус отключен.")
}

if wirelessChargerIsBroken == false && wirelessChargerTurnOn && wirelessChargerIsAvailable {
    print ("Беспроводная зарядка включена. Зарядите свое устройство.")
} else if wirelessChargerIsBroken == false && wirelessChargerTurnOn == false && wirelessChargerIsAvailable {
    print ("Беспроводная зарядка отключена.")
}

if oilLevelControllerIsBroken == false && oilLevel < 25 && oilLevelControllerIsAvailable {
    print ("Низкий уровень масла! Необходимо заехать на СТО.")
} else if oilLevelControllerIsBroken == false && oilLevel > 25 && oilLevelControllerIsAvailable {
    print ("Текущий уровень масла: \(oilLevel) %.")
}

if autopilotIsBroken == false && autopilotIsTurnOn {
    print ("Автопилот включен. Пожалуйста, следите за дорожной обстановкой!")
} else if autopilotIsBroken == false && autopilotIsTurnOn == false {
    print ("Автопилот отключен.")
}
