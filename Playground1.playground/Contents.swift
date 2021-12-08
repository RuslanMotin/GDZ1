import UIKit
// Практическое задание 1
// Задание 1 - решите квадратное уравнение:
//

let a: Double = 1
let b: Double = 3
let c = 4.0

let det = pow(b, 2) - 4 * a * c

if det > 0 {
    let x1 = (-b + sqrt(det)) / (2 * a)
    let x2 = (-b - sqrt(det)) / (2 * a)
    print("1x = \(x1)\n", "x2 = ", x2, separator: "")
} else if det == 0 {
    let x = -b / (2 * a)
    print("x1,2 = \(x)")
} else {
    print("Нет решений")
}
 
// Задание 2 - даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника:

let sideA: Double = 3
let sideB: Double = 5

let S = sideA * sideB / 2

let sideC = sqrt(sideA * sideA + pow(sideB, 2))

let P = sideA + sideB + sideC
 
// Задание 3 - ользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет:

var deposit: Double = 10000
var percent: Double = 10
let years: Int = 5

percent /= 100

for _ in 0..<5 {
    deposit += deposit * percent
    print(deposit)
}
