//
//  EndLessPageControlViewController.swift
//  ZQEndlessPageControl_Example
//
//  Created by zhengzeqin on 2021/9/23.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import ZQEndlessPageControl

class EndLessPageControlViewController: UIViewController {
    fileprivate struct Metric {
        static let indicatorPageControlWidth: CGFloat = 200
        static let indicatorPageControlHeight: CGFloat = 50
        static let indicatorPageDotSize: CGFloat = 8
    }
    
    fileprivate lazy var indicatorPageControl: ZQEndlessPageControlIndicator = {
        let indicatorPageControl = ZQEndlessPageControlIndicator()
        return indicatorPageControl
    }()
    
//    fileprivate lazy var scrollView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.createUI()
    }
}


extension EndLessPageControlViewController {
    fileprivate func createUI() {
        createPageControll()
    }
    
    fileprivate func createScrollView() {
        
    }
    
    fileprivate func createPageControll() {
        self.view.addSubview(indicatorPageControl)
        indicatorPageControl.snp.makeConstraints { (make) in
            make.width.equalTo(Metric.indicatorPageControlWidth)
            make.height.equalTo(Metric.indicatorPageControlHeight)
            make.center.equalToSuperview()
        }
        
        let indicatorConfigure = ZQEndlessPageControlConfiguration(
            numberOfDots: 10,
            dotSize: Metric.indicatorPageDotSize,
            dotBorderColor: UIColor.black.withAlphaComponent(0.19)
        )
        indicatorPageControl.setup(with: indicatorConfigure)
    }
}
