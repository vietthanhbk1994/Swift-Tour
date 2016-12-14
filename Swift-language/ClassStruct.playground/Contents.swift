//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)
struct FixedlengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedlengthRange(firstValue: 0, length: 3)
let rangeOfTFourItems = FixedlengthRange(firstValue: 0, length: 4)
rangeOfThreeItems.firstValue = 6

class DataImporter {
    var fileName = "data.txt"
}
class Datamanager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = Datamanager()
manager.data.append("Some data")
manager.data.append("Some more data")
//print(manager.importer.fileName)

struct Point{
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            return Point(x: 0.0, y: 0.0)
        }
        set {
            origin = newValue
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y:15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class Counter {
    var count = 0
    func increment() {
        self.count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
        
    }
}
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point1(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
class SomeClass {
    class func someTypeMethod() {
    
    }
}
SomeClass.someTypeMethod()
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
        
    }
}
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 4)
//print(threeTimesTable[2])
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//print(numberOfLegs["ant"]!)
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * column) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)