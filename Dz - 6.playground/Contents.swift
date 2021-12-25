import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */



/*
 Я так понял что "очередь" (queue) отличается от стэка тем что элементы добавляются не в конец, а в начало и удаляются последовательно слева направо.
 */

struct Queue<Q> {
var collection: [Q] = []
    
mutating func push(element: Q) {
    if collection.count == 0 {
       collection.append(element)
    } else {
        let newElement = [element] + collection
        collection = newElement
    }
  }
    
mutating func pop() {
    if collection.count != 0 {
        collection.remove(at: 0)
    }
  }
   
// Функция которая делает елементы в нашем массиве четными
mutating func filterIntEven(array: [Q]) {
    let collection = array.filter{$0 as! Int % 2 == 0}
    self.collection = collection
    }

// Создаем наш сабскрипт
subscript(indeX: Int?) -> Int? {
    get {
        var arrayIndex: [Int] = []
        for (index,_) in collection.enumerated() {
            arrayIndex += Array<Int>(arrayLiteral: index)
        }
        print("Список существующих индексов - \(arrayIndex)")
        if arrayIndex.contains(indeX!) {
            return collection[indeX!] as! Int?
            } else {
            print("В данный момент вы указали несуществующий индекс")
            return nil
        }
    }
  }
}

// Создаем экзэмпляр
var queue = Queue<Int>()

// Проверяем чтобы соответствовало заданию "очередь" (queue)
// на добавление элементов
queue.push(element: 234)
queue.collection
queue.push(element: 23)
queue.collection
queue.push(element: 12)
queue.collection
queue.push(element: 28)
queue.push(element: 1)
queue.collection

// на удаление элементов
queue.pop()
queue.collection
queue.pop()
queue.collection

// применяем метод фильтр
queue.filterIntEven(array: queue.collection)
queue.collection

// применяем наш сабскрипт
queue[2]
