//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//class Person {
//    let name: String
//    var apartment: Apartment?
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//    
//}
//class Apartment {
//    let number: Int
//    init(number: Int) {
//        self.number = number
//        print("\(number) is being initialized")
//    }
//    weak var tenant: Person?
//    deinit {
//        print("Apartment #\(number) is being deinitialized")
//    }
//}
//var john: Person?
//var number73: Apartment?
//john = Person(name: "John Appleseed")
//number73 = Apartment(number: 73)
//john!.apartment = number73
//number73!.tenant = john
//john = nil
//number73 = nil
//class Customer {
//    let name: String
//    var card: CreditCard?
//    init(name: String) {
//        self.name = name
//        print("Customer #\(name) initialized")
//    }
//    deinit {
//        print("Customer #\(name) is being deinitialized")
//    }
//}
//class CreditCard {
//    let number: UInt64
//    unowned let customer: Customer
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//        print("CreditCard #\(number) initialized")
//    }
//    deinit {
//        print("CreditCard #\(number) is being deinitialized")
//    }
//}
//var thanh: Customer?
//thanh = Customer(name: "Thanh")
//thanh!.card = CreditCard(number: 1234_5678_9012_3456, customer: thanh!)
//thanh = nil
//class Country {
//    let name: String
//    var capitalCity: City!
//    init(name: String, capitalName: String) {
//        self.name = name
//        self.capitalCity = City(name: capitalName, country: self)
//        print("Country #\(name) initialized")
//    }
//    deinit {
//        print("Country #\(name) deinitialized")
//    }
//}
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//        print("City #\(name) initialized")
//    }
//    deinit {
//        print("City #\(name) deinitialized")
//    }
//}
//var country = Country(name: "Vietnam", capitalName: "Hanoi")
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello, word")
print(paragraph!.asHTML())
paragraph = nil