//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Thanh on 12/5/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
