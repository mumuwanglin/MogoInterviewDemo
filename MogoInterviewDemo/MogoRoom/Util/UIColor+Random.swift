//
//  UIColor+Random.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/7/31.
//  Copyright © 2017年 王林. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let redValue = arc4random() % 255
        let greenValue = arc4random() % 255
        let blueValue = arc4random() % 255
        
        return UIColor(colorLiteralRed: Float(redValue)/255.0, green: Float(greenValue)/255.0, blue: Float(blueValue)/255.0, alpha: 1)
    }
}
