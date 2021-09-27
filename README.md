# ZQEndlessPageControl

[![CI Status](https://img.shields.io/travis/zhengzeqin/ZQEndlessPageControl.svg?style=flat)](https://travis-ci.org/zhengzeqin/ZQEndlessPageControl)
[![Version](https://img.shields.io/cocoapods/v/ZQEndlessPageControl.svg?style=flat)](https://cocoapods.org/pods/ZQEndlessPageControl)
[![License](https://img.shields.io/cocoapods/l/ZQEndlessPageControl.svg?style=flat)](https://cocoapods.org/pods/ZQEndlessPageControl)
[![Platform](https://img.shields.io/cocoapods/p/ZQEndlessPageControl.svg?style=flat)](https://cocoapods.org/pods/ZQEndlessPageControl)

## Example

- 为了适配 iOS14 的 pageControl 自定义的控件


效果

<img src="https://github.com/zeqinjie/ZQEndlessPageControl/blob/master/assets/1.gif" width="444" height="960" align="middle"/>

## USE

> 配置对象

```swift
public struct ZQEndlessPageControlConfiguration {
    /// 总共点个数
    var numberOfDots: Int
    /// 支持最大展示多少个点
    var maxNumberOfDots: ZQEndlessPageControlMaxNumberOfDots
    /// 选择点的颜色
    var selectedDotColor: UIColor
    /// 未选择点的颜色
    var unselectedDotColor: UIColor
    /// 点大小
    var dotSize: CGFloat
    /// 点间隙
    var spacing: CGFloat
    /// 未选中的缩放系数
    var unselectedScale: CGFloat
    /// 选中的缩放系数
    var selectedScale: CGFloat
    /// 最小的点的缩放系数
    var smallScale: CGFloat
    /// 点边框色
    var dotBorderColor: UIColor?
    /* 📢注意当设置了 selectedIndicatorImage & unselectedIndicatorImage 时候，不展示默认的圆点*/
    /// 当前选中展示图片
    var selectedIndicatorImage: UIImage?
    /// 当前未选中展示图片
    var unselectedIndicatorImage: UIImage?
}
```

> DEMO

```swift
import ZQEndlessPageControl

fileprivate let indicatorPageControl1: ZQEndlessPageControlIndicator = ZQEndlessPageControlIndicator()
self.view.addSubview(indicatorPageControl1)
indicatorPageControl1.snp.makeConstraints { (make) in
    make.width.equalTo(100)
    make.height.equalTo(50)
    make.center.equalToSuperview()
}
    
let indicatorConfigure = ZQEndlessPageControlConfiguration(
    numberOfDots: Metric.indicatorPageDotNum,
    dotSize: 8,
    dotBorderColor: UIColor.black.withAlphaComponent(0.19)
)
indicatorPageControl1.setup(configuration: indicatorConfigure)

// 设置指示图的图标
if #available(iOS 13.0, *) {
    self.view.addSubview(indicatorPageControl3)
    indicatorPageControl3.snp.makeConstraints { (make) in
        make.width.equalTo(300)
        make.height.equalTo(50)
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
```

## Installation

ZQEndlessPageControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZQEndlessPageControl'
```

## Author

zhengzeqin, zhengzeqin@addcn.com

## Release Notes
- v0.1.0: demo 展示

## License

ZQEndlessPageControl is available under the MIT license. See the LICENSE file for more info.
