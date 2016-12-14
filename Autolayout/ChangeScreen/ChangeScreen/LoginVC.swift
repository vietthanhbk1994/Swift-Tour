//
//  ViewController.swift
//  ChangeScreen
//
//  Created by Thanh on 12/1/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var songTitleLbl: UITextField!
    private var _songTitle: String!
    var songTitle: String {
        get {
            return _songTitle
        } set {
            _songTitle = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitleLbl.text = _songTitle
    }
}

