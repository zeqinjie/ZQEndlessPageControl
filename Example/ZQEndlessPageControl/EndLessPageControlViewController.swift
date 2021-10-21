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
        static let indicatorPageDotNum: Int = 11
        static let scrollViewBottomMargin: CGFloat = 100
        static let scrollViewHeight: CGFloat = 50
    }
    
    fileprivate let indicatorPageControl1: ZQEndlessPageControlIndicator = ZQEndlessPageControlIndicator()
    fileprivate let indicatorPageControl2: ZQEndlessPageControlIndicator = ZQEndlessPageControlIndicator()
    fileprivate let indicatorPageControl3: ZQEndlessPageControlIndicator = ZQEndlessPageControlIndicator()
    fileprivate let indicatorPageControl4: ZQEndlessPageControlIndicator = ZQEndlessPageControlIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "default"
        self.view.backgroundColor = .black
        self.createUI()
    }
}


extension EndLessPageControlViewController {
    fileprivate func createUI() {
        createScrollView()
        createPageControll1()
        createPageControll2()
        createPageControll3()
        createPageControll4()
    }
    
    fileprivate func createScrollView() {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.height.equalTo(Metric.scrollViewHeight)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Metric.scrollViewBottomMargin)
        }
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(Metric.indicatorPageDotNum), height: Metric.scrollViewHeight)
        var last: UIView?
        for index in 0...Metric.indicatorPageDotNum {
            let v = UILabel()
            v.isUserInteractionEnabled = true
            v.textAlignment = .center
            v.textColor = UIColor.randomColor
            v.backgroundColor = UIColor.randomColor
            v.text = "第\(index)个"
            scrollView.addSubview(v)
            v.snp.makeConstraints { make in
                make.width.height.top.equalToSuperview()
                if let lastV = last {
                    make.left.equalTo(lastV.snp.right)
                } else {
                    make.left.equalToSuperview()
                }
            }
            last = v
        }
    }
    
    fileprivate func createPageControll1() {
        self.view.addSubview(indicatorPageControl1)
        indicatorPageControl1.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        let indicatorConfigure = ZQEndlessPageControlConfiguration(
            numberOfDots: Metric.indicatorPageDotNum,
            dotSize: 10,
            dotBorderColor: UIColor.yellow,
            dotBorderWidth: 3
        )
        indicatorPageControl1.setup(configuration: indicatorConfigure)
    }
    
    fileprivate func createPageControll2() {
        self.view.addSubview(indicatorPageControl2)
//        indicatorPageControl2.backgroundColor = .yellow
        indicatorPageControl2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.indicatorPageControl1.snp.bottom).offset(10)
        }
        
        let indicatorConfigure = ZQEndlessPageControlConfiguration(
            numberOfDots: Metric.indicatorPageDotNum,
            selectedDotColor: .orange,
            unselectedDotColor: .green,
            dotSize: 10
        )
        indicatorPageControl2.setup(configuration: indicatorConfigure)
    }
    
    fileprivate func createPageControll3() {
        if #available(iOS 13.0, *) {
            self.view.addSubview(indicatorPageControl3)
            indicatorPageControl3.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.indicatorPageControl2.snp.bottom).offset(10)
            }
            
            let indicatorConfigure = ZQEndlessPageControlConfiguration(
                numberOfDots: Metric.indicatorPageDotNum,
                maxNumberOfDots: .seven,
                dotSize: 20,
                selectedIndicatorImage: UIImage(systemName: "sun.max.fill"),
                unselectedIndicatorImage: UIImage(systemName: "moon.fill")
            )
            
            indicatorPageControl3.setup(configuration: indicatorConfigure)
        }
    }
    
    fileprivate func createPageControll4() {
        self.view.addSubview(indicatorPageControl4)
        indicatorPageControl4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.indicatorPageControl3.snp.bottom).offset(10)
        }
        
        let indicatorConfigure = ZQEndlessPageControlConfiguration(
            numberOfDots: Metric.indicatorPageDotNum,
            dotSize: 10,
            selectedIndicatorImage: UIImage(named: "check_choice"),
            unselectedIndicatorImage: UIImage(named: "check_unchoice")
        )
        indicatorPageControl4.setup(configuration: indicatorConfigure)
    }
    
}

extension EndLessPageControlViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.bounds.width
        guard !(progress.isNaN || progress.isInfinite) else {
               return
        }
        let currentPage = Int(round(progress))
        indicatorPageControl1.selectedIndex = currentPage
        indicatorPageControl2.selectedIndex = currentPage
        indicatorPageControl3.selectedIndex = currentPage
        indicatorPageControl4.selectedIndex = currentPage
    }
}


