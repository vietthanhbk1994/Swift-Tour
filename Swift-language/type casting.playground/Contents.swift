//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//class MediaItem {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//class Movie: MediaItem {
//    var director: String
//    init(director: String, name: String) {
//        self.director = director
//        super.init(name: name);
//    }
//}
//class Song: MediaItem {
//    var artist: String
//    init(name: String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//let library = [
//    Movie(director: "Casablance", name: "Michael Curtiz"),
//    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
//    Movie(director: "Citizen Kane", name: "Orson Welles"),
//    Song(name: "The One And Only", artist: "Chesney Hawkes"),
//    Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
//    MediaItem(name: "Disney")
//]
//var movieCount = 0
//var songCount = 0
//var a = 1
//for item in library {
//    if item is Movie {
//        movieCount += 1
//    } else if item is Song {
//        songCount += 1
//    }
//}
//for item in library {
//    if let movie = item as? Movie {
//        print("Movie: \(movie.name), dir. \(movie.director)")
//    } else if let song = item as? Song {
//        print("Song: \(song.name), by \(song.artist)")
//    }
//}
//var things = [Any]()
//things.append(0)
//things.append(0.0)
//things.append("hello")
//things.append((3.0, 5.0))
//things.append(Movie(director: "Gost", name: "Iva"))
//things.append({ (name: String) -> String in "Hello, \(name)"})
//for thing in things {
//    switch thing {
//    case 0 as Int:
//        print("zero as an Int")
//    case 0 as Double:
//        print("zero as a Double")
//    case let someInt as Int:
//        print("an integer value of \(someInt)")
//    case let someDouble as Double where someDouble > 0:
//        print("a positive double value of \(someDouble)")
//    case is Double:
//        print("some other double value that I don't want to print")
//    case let someString as String:
//        print("a string value of \"\(someString)\"")
//    case let (x, y) as (Double, Double):
//        print("an (x, y) point at \(x), \(y)")
//    case let movie as Movie:
//        print("a movie called \(movie.name), dir. \(movie.director)")
//    case let stringConverter as (String) -> String:
//        print(stringConverter("Michael"))
//    default:
//        print("something else")
//    }
//}
struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "Suit is \(suit.rawValue)"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self}
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) metters")

let threeFeet = 3.ft
print("3 Feed is \(threeFeet) m")

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y:2.0), size: Size(width: 5.0, height: 5.0))
extension Rect {
    init(center: Point, size: Size) {
        
        let originX = center.x - (size.width / 2)
        
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
        
    }
}