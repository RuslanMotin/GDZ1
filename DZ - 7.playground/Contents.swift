import UIKit
/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/

// Часть 1:
enum Problem: Error {
    case lackOfMeaning // отсутсвие файла/отсутвие значения
}

enum Image: String {
    case image1 = "изображение_1"
    case image2 = "изображение_2"
}

enum Music: String {
    case music1 = "мелодия_1"
    case music2 = "мелодия_2"
}

class GameLoad {
    var image: Image?
    var music: Music?
    
    init(image: Image?, music: Music?) {
        self.image = image
        self.music = music
    }
    
// проверка с guard
    func errorTest1() {
        guard let _ = image else {
        return print(Problem.lackOfMeaning)
        }
        guard let _ = music else {
        return print(Problem.lackOfMeaning)
        }
        return print("Успешно выполнено!")
    }
    
// проверка с if
    func errorTest2() {
        if let _ = image {
        } else {
        return print(Problem.lackOfMeaning)
        }
        if let _ = music {
        } else {
        return print(Problem.lackOfMeaning)
        }
        return print("Успешно выполнено!")
    }
}

var game = GameLoad(image: .image1, music: .music1)
game.errorTest1() // проверка с guard
game.errorTest2() // проверка с if
// меняем свойство класса на nil и смотрим что получается
game.image = nil
// теперь проверяем
game.errorTest1() // проверка с guard
game.errorTest2() // проверка с if

// Часть 2:
class AgeOfPeople {
    var dictionary = ["Фёдор": 25, "Николай": 26, "Василий": 20]
    
// функция проверки  возраста свуществующих людей
    func error1(_ name: String) throws -> Int? {
        guard let _ = dictionary[name] else {
            throw Problem.lackOfMeaning
        }
        return dictionary[name]
    }
}

 var age = AgeOfPeople()

// проверяем cуществующее имя
do {
    let result = try age.error1("Фёдор")
    print("Этому человеку - \(result ?? 0) лет")
}  catch Problem.lackOfMeaning {
    print("Неверно указано имя человека!")
}

// проверяем несуществующее имя
do {
    let result = try age.error1("Сергей")
    print("Этому человеку - \(result ?? 0)лет")
}  catch Problem.lackOfMeaning {
    print("Неверно указано имя человека!")
}
