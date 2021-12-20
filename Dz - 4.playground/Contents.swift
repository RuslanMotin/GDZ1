import UIKit
/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
 */
 
enum Configuration {
    
   enum ModelAuto: String {
    case daf
    case ferrari
    }

   enum YearAuto: String {
    case year2015 = "2015"
    case year2018 = "2018"
    case year2019 = "2019"
    }

   enum TrunkVolume: Double {
    case volume150 = 150
    case volume50 = 50
    case volume100 = 100
    }
    
   enum Engine: String {
    case start = "запущен"
    case stop = "заглушен"
    }
    
   enum Window: String {
    case open = "открыты"
    case closed = "закрыты"
    }
    
    enum Hatch: String {
    case open = "открыт"
    case close = "закрыт"
    }
    
    enum Trailer: String {
        case yes = "прицеплен"
        case no = "отцеплен"
    }
}


class Car {
    var model: Configuration.ModelAuto
    var year: Configuration.YearAuto
    var trunkVolume: Configuration.TrunkVolume
    var engineStatus: Configuration.Engine
    var windows: Configuration.Window
    var trunkStatus: Double = 0 {
        didSet {
            if trunkStatus > trunkVolume.rawValue {
                trunkStatus = trunkVolume.rawValue
          } else if trunkStatus < 0 {
                trunkStatus = 0
        }
      }
    }
    init(model: Configuration.ModelAuto, year: Configuration.YearAuto, trunkVolume: Configuration.TrunkVolume, engineStatus: Configuration.Engine, windows: Configuration.Window) {
        self.model = model
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineStatus = engineStatus
        self.windows = windows
    }

    func configurationLoad(volume: Configuration.TrunkVolume ) {
        trunkStatus += volume.rawValue
    }
    func configurationUnload(volume: Configuration.TrunkVolume ) {
        trunkStatus -= volume.rawValue
    }
}

class TrunkCar: Car {
// прицеп тру если прицеплен и фолс если отцеплен
    var trailer: Configuration.Trailer
    init(model: Configuration.ModelAuto, year: Configuration.YearAuto, trunkVolume: Configuration.TrunkVolume, engineStatus: Configuration.Engine, windows: Configuration.Window, trailer: Configuration.Trailer) {
        self.trailer = trailer
    super.init(model: model, year: year, trunkVolume: trunkVolume, engineStatus: engineStatus, windows: windows)
    }
    
    func trailerOn() {
        if self.trailer == .no {
            trailer = .yes
            print("Прицеп подцепили")
        } else {
            print("Прицеп уже был ранее подцеплен")
        }
    }
    func trailerOff() {
        if self.trailer == .yes {
            trailer = .no
            print("Прицеп отцеплен")
        } else {
            print("Прицеп уже был ранее подцеплен")
        }
    }
}

class SportCar: Car {
    var carhatch: Configuration.Hatch
    init(model: Configuration.ModelAuto, year: Configuration.YearAuto, trunkVolume: Configuration.TrunkVolume, engineStatus: Configuration.Engine, windows: Configuration.Window, carhatch: Configuration.Hatch) {
        self.carhatch = carhatch
        super.init(model: model, year: year, trunkVolume: trunkVolume, engineStatus: engineStatus, windows: windows)
    }
    func carhatchOn() {
        if carhatch == .close {
            carhatch = .open
            print("Люк открыли")
        } else {
            print("Люк уже был открыт")
        }
    }
    func carhatchOff() {
        if carhatch == .open {
            carhatch = .close
            print("Люк закрыли")
        } else {
            print("Люк уже был закрыт")
        }
    }
}
// Переопределяем методы в каждом классе
class Trunk: TrunkCar {
    override func trailerOn() {
        super.trailerOn()
        print("сообщение из переопределения метода TrunkCar")
    }
}
// Переопределяем методы в каждом классе
class Sport: SportCar {
    override func carhatchOn() {
        super.carhatchOn()
        print("cообщение из  переопределения метода SportCar")
    }
}

var trunk = TrunkCar(model: .daf, year: .year2019, trunkVolume: .volume150, engineStatus: .start, windows: .open, trailer: .no)

// cоздаю функцию вывода на консоль информации - обновление
func viewTrunk () {
print("Описываемый автомобиль - \(trunk.model.rawValue), произведен в \(trunk.year.rawValue) году, максимально допустимый объем багажника \(trunk.trunkVolume.rawValue)куб.см, состояние двигателя - \(trunk.engineStatus.rawValue), окна \(trunk.windows.rawValue), на данный момент в багажнике находится - \(trunk.trunkStatus)куб.см груза, прицеп - \(trunk.trailer.rawValue) ")
}
viewTrunk()
// меняем свойство методом
trunk.trailerOn()
// обновляем на консоли информацию функцией
viewTrunk()

var sport = SportCar(model: .ferrari, year: .year2015, trunkVolume: .volume50, engineStatus: .stop, windows: .closed, carhatch: .open)
func viewSport() {
    print(" Описываемый автомобиль - \(sport.model.rawValue), произведен в \(sport.year.rawValue) году, максимально допустимый объем багажника \(sport.trunkVolume.rawValue)куб.см, состояние двигателя - \(sport.engineStatus.rawValue), окна \(sport.windows.rawValue), на данный момент в багажнике находится - \(sport.trunkStatus)куб.см груза, люк - \(sport.carhatch.rawValue)")
}
viewSport()
sport.carhatchOff()
viewSport()
