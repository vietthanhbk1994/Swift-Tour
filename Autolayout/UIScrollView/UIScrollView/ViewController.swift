//
//  ViewController.swift
//  UIScrollView
//
//  Created by Thanh on 12/1/16.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    var contentWidth: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollViewWidth = scrollView.frame.size.width
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView =  UIImageView(image: image)
            images.append(imageView)
            var newX: CGFloat = 0.0
            newX = scrollViewWidth / 2 + scrollViewWidth * CGFloat(x)
            contentWidth += newX
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 150 / 2, y: scrollView.frame.size.height / 2 - 150 / 2, width: 150, height: 150)
        }
        //scrollView.backgroundColor = UIColor.purple
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }

}

