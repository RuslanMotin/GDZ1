import UIKit
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */

protocol Car {
    var model: Configure.Model { get set }
    var fuel: Configure.Fuel { get set }
    var engineCapacity: Configure.EngineCapacity { get set }
    var window: Configure.Windows { get set }
    var engine: Configure.Engine { get set }
    func mod(a: Configure.Model)
}


extension Car {
    mutating func dieselPetrol(a: Configure.Fuel) {
        self.fuel = a
    }
    
    mutating func value(a: Configure.EngineCapacity) {
        self.engineCapacity = a
    }
    
    mutating func openClouse(a: Configure.Windows) {
        self.window = a
    }
    
    mutating func onOff(a: Configure.Engine) {
        self.engine = a
    }
}

enum Configure {
    enum Model: String {
        case man = "MAN"
        case ferrari = "Ferrari"
    }
    
    enum Fuel: String {
        case diesel = "дизель"
        case petrol = "бензин"
    }
    
    enum EngineCapacity: Double {
        case value1 = 5.0
        case value2 = 6.0
    }
    
    enum Windows: String {
        case open = "открыты"
        case clouse = "закрыты"
    }
    
    enum Engine: String {
        case on = "заведен"
        case off = "заглушен"
    }
    
    enum Tank: Int {
        case volume1 = 34570
        case volume2 = 33862
    }
    
    enum Equipmen: String {
        case sport = "спорт"
        case comfort = "комфорт"
    }
}

// MARK: - Класс по грузовику с цистерной

class TrunkCar: Car {
// Модель авто
    var model: Configure.Model
// Вид потребляемого топлива автомобилем
    var fuel: Configure.Fuel
// Объём двигателя
    var engineCapacity: Configure.EngineCapacity
// Состояние окон
    var window: Configure.Windows
// Состояние двигателя
    var engine: Configure.Engine
// Объем подцепленной цистерны
    var tankVolume: Configure.Tank
    
    func mod(a: Configure.Model) {
       model = a
    }
    
    init(model: Configure.Model, fuel: Configure.Fuel, engineCapacity: Configure.EngineCapacity, window: Configure.Windows, engine: Configure.Engine, tankVolume: Configure.Tank) {
        self.model = model
        self.fuel = fuel
        self.engineCapacity = engineCapacity
        self.window = window
        self.engine = engine
        self.tankVolume = tankVolume
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        "Модель автомобиля - \(model.rawValue), тип потребляемого топлива - \(fuel.rawValue), объем двигателя - \(engineCapacity.rawValue)см, в настоящий момент окна в автомобиле \(window.rawValue), двигатель \(engine.rawValue), объём подцепленной цистерны составляет - \(tankVolume.rawValue)см"
    }
}
// MARK: - Класс по спорткару

class SportCar: Car {
// Модель авто
    var model: Configure.Model
// Вид потребляемого топлива автомобилем
    var fuel: Configure.Fuel
// Объём двигателя
    var engineCapacity: Configure.EngineCapacity
// Состояние окон
    var window: Configure.Windows
// Состояние двигателя
    var engine: Configure.Engine
// Комплектация автомобиля
    var vehicleEquipmen: Configure.Equipmen

    func mod(a: Configure.Model) {
        self.model = a
    }
    
    init(model: Configure.Model, fuel: Configure.Fuel, engineCapacity: Configure.EngineCapacity, window: Configure.Windows, engine: Configure.Engine, vehicleEquipmen: Configure.Equipmen) {
        self.model = model
        self.fuel = fuel
        self.engineCapacity = engineCapacity
        self.window = window
        self.engine = engine
        self.vehicleEquipmen = vehicleEquipmen
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        "Модель автомобиля - \(model.rawValue), тип потребляемого топлива - \(fuel.rawValue), объем двигателя - \(engineCapacity.rawValue)см, в настоящий момент окна в автомобиле \(window.rawValue), двигатель \(engine.rawValue), комплектация - \(vehicleEquipmen.rawValue)"
    }
}

// Грузовик c цистерной

var trunk = TrunkCar(model: .man, fuel: .diesel, engineCapacity: .value2, window: .open, engine: .on, tankVolume: .volume2)
// глушим двигатель
trunk.onOff(a: .off)
// открываем окна
trunk.openClouse(a: .clouse)
print(trunk.description)

// Спорткар

var sport = SportCar(model: .ferrari, fuel: .petrol, engineCapacity: .value1, window: .clouse, engine: .off, vehicleEquipmen: .comfort)
// заводим двигатель
sport.onOff(a: .on)
// открываем окна
sport.openClouse(a: .open)
print(sport.description)
