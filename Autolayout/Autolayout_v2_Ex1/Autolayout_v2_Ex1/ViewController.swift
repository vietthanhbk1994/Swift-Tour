//
//  ViewController.swift
//  Autolayout_v2_Ex1
//
//  Created by Thanh on 11/30/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imageViewPill: UIImageView!
    
    @IBOutlet weak var imageViewSuccess: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var viewDivider: UIView!
    @IBOutlet weak var lbTitle: UILabel!

    @IBOutlet weak var tfKey: UITextField!
    @IBOutlet weak var lbKey: UILabel!
    @IBOutlet weak var tfZipcode: UITextField!
    @IBOutlet weak var tfCountry: UITextField!
    @IBOutlet weak var lbZipcode: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var lbState: UILabel!
    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var lbCity: UILabel!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var lbFullname: UILabel!
    @IBOutlet weak var btnChooseState: UIButton!
    @IBOutlet weak var pickerViewState: UIPickerView!
    @IBOutlet weak var btnBuyNow: UIButton!
    let status = ["Hà Nội", "Đà Nẵng", "Thừa Thiên Huế", "Hồ Chi Minh"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewState.dataSource = self
        pickerViewState.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionBtnChooseState(_ sender: Any) {
        lbKey.isHidden = true
        lbZipcode.isHidden = true
        lbCountry.isHidden = true
        tfKey.isHidden = true
        tfZipcode.isHidden = true
        tfKey.isHidden = true
        tfCountry.isHidden = true
        pickerViewState.isHidden = false
        
    }
    

    @IBAction func actionBtnBuyNow(_ sender: Any) {
        lbKey.isHidden = true
        lbZipcode.isHidden = true
        lbCountry.isHidden = true
        lbCity.isHidden = true
        lbPrice.isHidden = true
        lbState.isHidden = true
        lbAddress.isHidden = true
        lbFullname.isHidden = true
        lbTitle.isHidden = true
        imageViewPill.isHidden = true
        
        tfKey.isHidden = true
        tfZipcode.isHidden = true
        tfKey.isHidden = true
        tfCountry.isHidden = true
        tfFullname.isHidden = true
        tfAddress.isHidden = true
        pickerViewState.isHidden = false
        
        pickerViewState.isHidden = true
        btnBuyNow.isHidden = true
        btnChooseState.isHidden = true
        viewDivider.isHidden = true
        imageViewSuccess.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return status[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnChooseState.setTitle(status[row], for: UIControlState())
        lbKey.isHidden = false
        lbZipcode.isHidden = false
        lbCountry.isHidden = false
        tfKey.isHidden = false
        tfZipcode.isHidden = false
        tfKey.isHidden = false
        tfCountry.isHidden = false
        pickerViewState.isHidden = true
    }
}

