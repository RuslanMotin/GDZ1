import UIKit


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
}

// Спорткар
struct SportCar {
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
        
    mutating func configurationLoad(volume: Configuration.TrunkVolume ) {
        trunkStatus += volume.rawValue
    }
    mutating func configurationUnload(volume: Configuration.TrunkVolume ) {
        trunkStatus -= volume.rawValue
    }
}

// Грузовик
struct TrunkCar {
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
        
    mutating func configurationLoad(volume: Configuration.TrunkVolume ) {
        trunkStatus += volume.rawValue
    }
    mutating func configurationUnload(volume: Configuration.TrunkVolume ) {
        trunkStatus -= volume.rawValue
    }
}

// MARK: - Всё что касается спорткара:

var sportCar = SportCar(model: .ferrari, year: .year2018, trunkVolume: .volume50, engineStatus: .start, windows: .open)
// Добавляем в багажник (ОГРАНИЧЕНИЯ УСТАНОВЛЕНЫ В СВОЙСТВЕ)
sportCar.configurationLoad(volume: .volume50)
// Смотрим статус багажника
sportCar.trunkStatus
// Загружаем в багажник больше нашего установленного допустимого объема в экземпляре
sportCar.configurationLoad(volume: .volume100)
// И видим что больше нашего заданного в экземпляре объема загрузить не получается
sportCar.trunkStatus
print(" Описываемый автомобиль - \(sportCar.model.rawValue), произведен в \(sportCar.year.rawValue) году, максимально допустимый объем багажника \(sportCar.trunkVolume.rawValue)куб.см, состояние двигателя - \(sportCar.engineStatus.rawValue), окна \(sportCar.windows.rawValue), на данный момент в багажнике находится - \(sportCar.trunkStatus)куб.см груза.")

// MARK: - Всё что касается грузовика:

var trunkCar = TrunkCar(model: .daf, year: .year2019, trunkVolume: .volume150, engineStatus: .stop, windows: .closed)
// добавим груз
trunkCar.configurationLoad(volume: .volume150)
// cтатус баажника
trunkCar.trunkStatus

print(" Описываемый автомобиль - \(trunkCar.model.rawValue), произведен в \(trunkCar.year.rawValue) году, максимально допустимый объем багажника \(trunkCar.trunkVolume.rawValue)куб.см, состояние двигателя - \(trunkCar.engineStatus.rawValue), окна \(trunkCar.windows.rawValue), на данный момент в багажнике находится - \(trunkCar.trunkStatus)куб.см груза.")
