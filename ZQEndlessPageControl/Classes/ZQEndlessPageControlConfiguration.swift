import Foundation
import UIKit

public struct ZQEndlessPageControlConfiguration {
    /// 总共点个数
    public var numberOfDots: Int
    /// 支持最大展示多少个点
    public var maxNumberOfDots: ZQEndlessPageControlMaxNumberOfDots
    /// 选择点的颜色
    public var selectedDotColor: UIColor
    /// 未选择点的颜色
    public var unselectedDotColor: UIColor
    /// 点大小
    public var dotSize: CGFloat
    /// 点间隙
    public var spacing: CGFloat
    /// 未选中中号缩放系数
    public var mediumScale: CGFloat
    /// 选中的缩放系数
    public var selectedScale: CGFloat
    /// 未选中最小的点的缩放系数
    public var smallScale: CGFloat
    /// 点边框色
    public var dotBorderColor: UIColor?
    /// 点边框色大小
    public var dotBorderWidth: CGFloat?
    /* 📢注意当设置了 selectedIndicatorImage & unselectedIndicatorImage 时候，不展示默认的圆点*/
    /// 当前选中展示图片
    public var selectedIndicatorImage: UIImage?
    /// 当前未选中展示图片
    public var unselectedIndicatorImage: UIImage?
    
    public init(
        numberOfDots: Int,
        maxNumberOfDots: ZQEndlessPageControlMaxNumberOfDots = .five,
        selectedDotColor: UIColor = UIColor.white.withAlphaComponent(0.95),
        unselectedDotColor: UIColor = UIColor.white,
        dotSize: CGFloat = 8,
        spacing: CGFloat = 6,
        mediumScale: CGFloat = 0.75,
        selectedScale: CGFloat = 1.0,
        smallScale: CGFloat = 0.5,
        dotBorderColor: UIColor? = nil,
        dotBorderWidth: CGFloat? = nil,
        selectedIndicatorImage: UIImage? = nil,
        unselectedIndicatorImage: UIImage? = nil
    ) {
        self.numberOfDots = numberOfDots
        self.maxNumberOfDots = maxNumberOfDots
        self.selectedDotColor = selectedDotColor
        self.unselectedDotColor = unselectedDotColor
        self.dotSize = dotSize
        self.spacing = spacing
        self.mediumScale = mediumScale
        self.selectedScale = selectedScale
        self.smallScale = smallScale
        self.dotBorderColor = dotBorderColor
        self.dotBorderWidth = dotBorderWidth
        self.selectedIndicatorImage = selectedIndicatorImage
        self.unselectedIndicatorImage = unselectedIndicatorImage
    }
}

extension ZQEndlessPageControlConfiguration: Equatable {
    
}
