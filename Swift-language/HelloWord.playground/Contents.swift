//: Playground - noun: a place where people can play

import UIKit

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var names = ["a", "v", "b"]
var reversedNames = names.sorted(by: backward)
print(reversedNames)
names = ["a", "v", "b"]
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//inline closure expression syntax
reversedNames = names.sorted(by: { (s1, s2) in return s1 > s2 })
reversedNames = names.sorted(by: { (s1, s2) in s1 > s2 })
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: >)
print(reversedNames)
//trailing closure. --> need pass losure expression
func someFunctionThatTakesAClosure(closure: () -> Void) {

}
someFunctionThatTakesAClosure(closure: {

})
someFunctionThatTakesAClosure() {
    
}
reversedNames = names.sorted() { $0 > $1}
reversedNames = names.sorted { $0 > $1}
print(reversedNames)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
//print(strings)
//print(numbers)
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        
        someFunctionNonescapingClosure { x = 200 }
        someFunctionWithEscapingClosure { self.x = 100 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?() //------> la cai chi ri
print(instance.x)

var customersIntLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersIntLine.count)
let customersProvider = {customersIntLine.remove(at: 0)}
print(customersIntLine.count)
print("Now serving \(customersProvider())!")
print(customersIntLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now weving \(customersProvider())!")
}
serve(customer: { customersIntLine.remove(at: 0) } )

func serve1(customer customerProvider: @autoclosure () -> String) {
    print("Now weving \(customersProvider())!")
}
serve1(customer: customersIntLine.remove(at: 0) )
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
    func getBarcode() {
        switch self {
        case let .upc(numberSystem, manufacturer, product, check):
            print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
        }
    }
}
var productBarcode = Barcode.qrCode("Demama")
productBarcode.getBarcode()
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum CompassPoint: String {
    case north, south, east, west
}
let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"
let positionToFind = 1
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five =  ArithmeticExpression.number(5)
let four =  ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}