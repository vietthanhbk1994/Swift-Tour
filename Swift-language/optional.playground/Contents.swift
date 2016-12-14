//: Playground - noun: a place where people can play

import UIKit
class Person {
    var residence: Residence?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence hs \(roomCount) room(s)")
} else {
    print("Unable")
}
let someAddress = Address()
someAddress.buildingName = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

enum VendingMachineError: Error {
    case invalidSelection
    case insuffcientFunds(coinsNeeded: Int)
    case outOfStock
}
throw VendingMachineError.insuffcientFunds(coinsNeeded: 5)
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.invalidSelection
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insuffcientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vedingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vedingMachine.vend(itemNamed: snackName)
}