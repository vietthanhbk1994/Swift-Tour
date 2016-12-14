//: Playground - noun: a place where people can play

import UIKit

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: () -> String) {
    print(customersInLine.count)
    print("Now serving \(customerProvider())!")
    print(customersInLine.count)
}
serve(customer: { customersInLine.remove(at: 0) } )

// Prints "Now serving Alex!"
func serve1(customer customerProvider: @autoclosure () -> String) {
    print(customersInLine.count)
    print("Now serving \(customerProvider())!")
    print(customersInLine.count)
}
serve1(customer: customersInLine.remove(at: 0))