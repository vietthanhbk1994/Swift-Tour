//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum QueueError : Error
{
    case overSizeError, empty, full
}

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
class Queue<T>
{
    var size: Int = 0
    var top: Node<T>?
    
    init(size: Int) throws {
        if (size < 1 || size > 10) {
            throw QueueError.overSizeError
        }
        self.size = size
    }
    
    func printQueue() -> Void {
        print("Queue: \(self.size)")
        var currentNode = self.top
        while let sNode = currentNode {
            print("___\(sNode.value)___")
            currentNode = sNode.next
        }
    }
    
    func enqueue(value: T) throws -> Void {
        if self.count() >= size {
            throw QueueError.full
        }
        let newNode: Node<T> = Node<T>(value: value)
        
        if let sTop = top {
            var tail = sTop
            while let _ = tail.next {
                tail = tail.next!
            }
            tail.next = newNode
        } else {
            top = newNode
        }
    }
    
    func dequeue() throws -> T {
        if let sTop = self.top {
            let returnValue = sTop.value
            self.top = sTop.next
            return returnValue
        } else {
            throw QueueError.empty
        }
    }
    
    func count() -> Int {
        var n: Int = 0
        if let sTop = top {
            n += 1
            var tail = sTop
            while let _ = tail.next {
                n += 1
                tail = tail.next!
            }
        }
        return n
    }
}

//-----------------TEST QUEUE ---------------

do {
    var q: Queue<Int> = try Queue<Int>(size: 5)
    //q.enQueue(value: 1)
    //q.enQueue(value: 1)
    //q.enQueue(value: 4)
    try q.enqueue(value: 2)
    try q.enqueue(value: 3)
    q.printQueue()
    try q.dequeue()
    try q.dequeue()
    try q.dequeue()
    q.printQueue()
} catch let error {
    print("ERRRORORR \(error)")
}

