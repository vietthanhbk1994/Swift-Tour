//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class Vehicle {
    var currentSpeed = 0.0
    var desciption: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
    
    }
}
let someVehicle = Vehicle()
someVehicle.desciption

class Bicycle: Vehicle {
    var hasBasket = false
    override func makeNoise() {
        print("Cho choo")
    }
    override var desciption: String {
        return "Go home \(currentSpeed)"
    }
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
bicycle.desciption
bicycle.makeNoise()

class Tandem: Bicycle {
    var currentNumberOfPassemgers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassemgers = 2
tandem.currentSpeed = 22.0
tandem.desciption
class Car: Vehicle {
    var gear = 1
    override var desciption: String {
        return super.desciption + " in gear \(gear)"
    }
}
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            
        }
    }
}
struct Celsius {
    var temperatureInCelsius: Double
    init(fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fahrenheit: 212.0)
let freezingPointOfWater = Celsius(kelvin: 273.15)
class SurveyQuestion {
    var text: String
    var respon: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
        text = "1"
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese")
cheeseQuestion.ask()
cheeseQuestion.text = "1"
cheeseQuestion.respon = "Yes"
struct ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem(name: "Thanh", quantity: 2, purchased: true)
item.name
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}