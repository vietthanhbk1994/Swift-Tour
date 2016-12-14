//: Playground - noun: a place where people can play

import UIKit

//protocol SomeProtocol {
//    var mustBeSettable: Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//}
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//}
//protocol FullyNamed {
//    var fullName: String { get }
//}
//struct Person: FullyNamed {
//    var fullName: String
//}
//let john = Person(fullName: "Thanh")
//john.fullName
//class Starship: FullyNamed {
//    var prefix: String?
//    var name: String
//    init(name: String, prefix: String? = nil) {
//        self.name = name
//        self.prefix = prefix
//    }
//    var fullName: String {
//        return (prefix != nil ? prefix! + " " : " ") + name
//    }
//}
//var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
//ncc1701.fullName
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//class LinearCongruentialGenerator: RandomNumberGenerator {
//    var lastRandom = 42.0
//    let m = 139968.0
//    let a = 123.0
//    let c = 234.0
//    func random() -> Double {
//        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
//        return lastRandom / m
//    }
//}
//let generator = LinearCongruentialGenerator()
//print("Here's is random number:\(generator.random())")
//print("And another one: \(generator.random())")
//
//protocol Togglable {
//    mutating func toggle()
//}
//enum OnOffSwitch: Togglable {
//    case off, on
//    mutating func toggle() {
//        switch self {
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}
//var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()
//protocol SomeProtocol {
//    init(someParameter: Int)
//}
//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//        
//    }
//}
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//class Dice {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//    func roll() -> Int {
//        return Int(generator.random() * Double(sides)) + 1
//    }
//}
//var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("Random dice roll is \(d6.roll())")
//}
//protocol DiceGame {
//    var dice: Dice { get }
//    func play()
//}
//protocol DiceGameDelegate {
//    func gameDidStart(_ game: DiceGame)
//    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRool: Int)
//    func gameDidEnd(_ game: DiceGame)
//}
//class SankeAndLadders: DiceGame {
//    let finalSquare = 25
//    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
//    var square = 0
//    var board: [Int]
//    init() {
//        board = Array(repeating: 0, count: finalSquare + 1)
//        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//    }
//    var delegate: DiceGameDelegate?
//    func play() {
//        square = 0
//        delegate?.gameDidStart(self)
//        gameLoop: while square != finalSquare {
//            let diceRoll = dice.roll()
//            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
//            switch square + diceRoll {
//            case finalSquare:
//                break gameLoop
//            case let newSquare where newSquare > finalSquare:
//                continue gameLoop
//            default:
//                square += diceRoll
//                square += board[square]
//            }
//        }
//        delegate?.gameDidEnd(self)
//    }
//}
//class DiceGameTracker: DiceGameDelegate {
//    var numberOfTurns = 0
//    func gameDidStart(_ game: DiceGame) {
//        numberOfTurns = 0
//        if game is SankeAndLadders {
//            print("Started a new game of Snakes and Ladders")
//        }
//        print("The game is using a \(game.dice.sides) - sided dice")
//    }
//    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
//        numberOfTurns += 1
//        print("Rolled a \(diceRoll)")
//    }
//    func gameDidEnd(_ game: DiceGame) {
//        print("The game lasted for \(numberOfTurns) turns")
//    }
//}
//let tracker = DiceGameTracker()
//let game = SankeAndLadders()
//game.delegate = tracker
//game.play()
//protocol TextRepresentable {
//    var textualDescription: String { get }
//}
//extension Dice: TextRepresentable {
//    var textualDescription: String {
//        return "A \(sides) - sided dice"
//    }
//}
//protocol Named {
//    var name: String { get }
//}
//protocol Aged {
//    var age: Int { get }
//}
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//func wishHappyBirthday(to celebrator: Named & Aged){
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
//}
//let birthdayPerson = Person(name: "Thanh", age: 23)
//wishHappyBirthday(to: birthdayPerson)
protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 234_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}