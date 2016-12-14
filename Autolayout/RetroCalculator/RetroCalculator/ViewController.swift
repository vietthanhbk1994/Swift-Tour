//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Thanh on 12/1/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    
    enum Operation: String {
        case add = "+"
        case sub = "-"
        case mul = "*"
        case div = "/"
        case empty = "empty"
    }
    
    var currentOperator = Operation.empty
    var runningNumber = ""
    var leftValueStr = ""
    var rightValueStr = ""
    var result = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        do {
           try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDivPressed(sender: AnyObject) {
        processOperation(operation: .div)
    }
    
    @IBAction func onMulPressed(sender: AnyObject) {
        processOperation(operation: .mul)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .add)
    }
    
    @IBAction func onSubPressed(sender: AnyObject) {
        processOperation(operation: .sub)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperator)
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    func processOperation(operation: Operation) {
        playSound()
        if currentOperator != Operation.empty {
            if runningNumber != "" {
                rightValueStr = runningNumber
                runningNumber = ""
                switch currentOperator {
                case Operation.mul:
                    result = "\(Double(leftValueStr)! * Double(rightValueStr)!)"
                case Operation.div:
                    result = "\(Double(leftValueStr)! / Double(rightValueStr)!)"
                case Operation.add:
                    result = "\(Double(leftValueStr)! + Double(rightValueStr)!)"
                case Operation.sub:
                    result = "\(Double(leftValueStr)! - Double(rightValueStr)!)"
                default:
                    result = "Error"
                }
                leftValueStr = result
                outputLbl.text = result
            }
            currentOperator = operation
        } else {
            leftValueStr = runningNumber
            runningNumber = ""
            currentOperator = operation
        }
    }
}

