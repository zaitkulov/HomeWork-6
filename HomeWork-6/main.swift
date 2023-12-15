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

