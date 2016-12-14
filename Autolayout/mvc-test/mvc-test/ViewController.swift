//
//  ViewController.swift
//  mvc-test
//
//  Created by Thanh on 12/5/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var renameTextField: UITextField!
    @IBOutlet weak var renameBtn: UIButton!
    @IBOutlet weak var fullName: UILabel!
    
    let person = Person(firstName: "Ngo Viet", lastName: "Thanh")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = person.fullName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func renamePressed(_ sender: Any) {
        if let txt = renameTextField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
        
    }

}

