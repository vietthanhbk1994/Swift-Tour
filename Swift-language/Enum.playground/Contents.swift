//: Playground - noun: a place where people can play

import Cocoa

class Vehicle {
    var numberOfWheels = 0
    var desciption: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.desciption)")
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.desciption)")
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMear = Food()
namedMeat.name
mysteryMear.name

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let recipe = RecipeIngredient()
print(recipe.name)
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
     print("An animal was initialized with a species of \(giraffe.species)")
}
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
enum Temperature: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let fahrenheitUnit = Temperature(rawValue: "K")
if fahrenheitUnit != nil {
    print("Success")
}
let unknownUnit = Temperature(rawValue: "X")
if unknownUnit == nil {
    print("Not defined")
}
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil}
        self.name = name
    }
}
if let product = Product(name: "a") {
    print("\(product.name)")
}
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untiled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Unitled]"
        } else {
            self.name = name
        }
    }
}
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}