//
//  ViewController.swift
//  Helloword
//
//  Created by Thanh on 11/30/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var welcomeBtn: UIButton!
    @IBOutlet weak var myNameImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionWelcome(_ sender: Any) {
        backgroundImageView.isHidden = false
        welcomeBtn.isHidden = true
        myNameImageView.isHidden = false
    }

}

