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


