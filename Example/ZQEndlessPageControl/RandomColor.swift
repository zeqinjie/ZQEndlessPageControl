//
//  RandomColor.swift
//  ZQEndlessPageControl_Example
//
//  Created by zhengzeqin on 2021/9/27.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    //返回随机颜色
    open class var randomColor:UIColor{
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
