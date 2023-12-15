//
//  main.swift
//  HomeWork-6
//
//  Created by Артем Заиткулов on 15.12.2023.
//

import Foundation

//1.Задание: Описание структур SportCar и TrunkCar

struct SportCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var currentTrunkVolume: Double
}

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineRunning: Bool
    var windowsOpen: Bool
    var currentTrunkVolume: Double
}

var mySportCar = SportCar(brand: "Lamborgini", year: 2023, trunkVolume: 0.5, engineRunning: false, windowsOpen: false, currentTrunkVolume: 0.0)

var myTrunkCar = TrunkCar(brand: "Mercedes", year: 2020, trunkVolume: 10, engineRunning: true, windowsOpen: true, currentTrunkVolume: 5.0)

//2.Задание: Создайте перечисления действий с автомобилем

enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Int)
    case unloadCargo(volume: Int)
    
    var availableCargoVolume: Int {
        return 20
    }
}

var myCar = CarAction.startEngine
print (myCar)

myCar = CarAction.loadCargo(volume: 21)
print(myCar)

switch myCar {
case.startEngine:
    print("Двигатель запущен")
case.stopEngine:
    print("Двигатель заглушен")
case.openWindows:
    print("Окна открыты")
case.closeWindows:
    print("Окна закрыты")
case.loadCargo(let volume) where volume <= myCar.availableCargoVolume:
    print ("Груз массой \(volume) тонн - загружен")
case.loadCargo(let volume):
    print ("Перегруз! Невозможно позгрузить \(volume) тонн")
case.unloadCargo(let volume):
    print ("Груз массой \(volume) успешно загружен")
}

//3.Задание: Добавление метода для изменения свойств автомобиля

enum CarAction {
    case startEngine
    case stopEngine
    case loadCargo(volume: Int)
    case unloadCargo(volume: Int)
}
struct Car {
    var isEngineRunning = false
    var trunkCapacity = 40
    mutating func performAction(_ action: CarAction) {
        switch action {
        case.startEngine:
            if !isEngineRunning {
                isEngineRunning = true
                print ("Двигатель запущен")
            } else {
                print ("Двигатель уже запущен")
            }
        case.stopEngine:
            if isEngineRunning {
                isEngineRunning = false
                print("Двигатель заглушен")
            } else {
                print ("Двигатель уже заглушен")
            }
        case.loadCargo(let volume):
            if isEngineRunning {
                if trunkCapacity >= volume {
                    trunkCapacity -= volume
                    print ("Погрузка завершена! Остаточное место в багажнике - \(trunkCapacity) тонн")
                } else {
                    print ("Перегруз! Недостаточно места в грузовом отсеке")
                }
            } else {
                print ("Запустите двигатель, чтобы загрузить груз")
            }
        case.unloadCargo(let volume):
            if isEngineRunning {
                trunkCapacity += volume
                print ("Выгрузка завершена! Остаточное место в грузовом отсеке - \(trunkCapacity) тонн")
            } else {
                print ("Запустите двигатель, для начала погрузки")
            }
        }
    }
}
var myCar = Car()
myCar.performAction(.startEngine)
myCar.performAction(.loadCargo(volume: 40))
myCar.performAction(.unloadCargo(volume: 35))
myCar.performAction(.stopEngine)


//4. Инициализация и использование структур

enum Action {
    case drive
    case stop
    case parking
}
struct Person {
    var name: String
    var age: Int
    
    func perform(action: Action) {
        switch action {
        case.drive:
            print ("\(name) едет")
        case.stop:
            print ("\(name) стоит")
        case.parking:
            print("\(name) паркуется")
        }
    }
}
struct Car {
    var brand: String
    var model: String
    var year: Int
    
    func perform(action: Action) {
        switch action {
        case.drive:
            print("\(brand) \(model) едет")
        case.stop:
            print("\(brand) \(model) стоит")
        case.parking:
            print("\(brand) \(model) паркуется")
        }
    }
}
let person1 = Person(name: "Artyom", age: 27)
let person2 = Person(name: "Shamil", age: 35)

let car1 = Car(brand: "Porche", model: "911", year: 2022 )
let car2 = Car(brand: "Toyota", model: "Land Cruiser PRADO", year: 2022 )

person1.perform(action: .drive)
person2.perform(action: .parking)
car1.perform(action: .stop)
car2.perform(action: .drive)

//5.Задание:Вывод свойств объектов

enum Action {
    case eat
    case sleep
    case work
}
struct Person {
    var name: String
    var age: Int
    
    func performAction(_ action: Action) {
        switch action {
        case.eat:
            print ("\(name) кушает")
        case.sleep:
            print ("\(name) спит")
        case.work:
            print("\(name) работает")
        }
    }
}
let person1 = Person(name: "Artyom", age: 27)
let person2 = Person(name: "Shamil", age: 35)

person1.performAction(.eat)
person2.performAction(.work)

print("Person 1 - Name: \(person1.name), Age: \(person1.age)")
print("Person 2 - Name: \(person2.name), Age: \(person2.age)")

