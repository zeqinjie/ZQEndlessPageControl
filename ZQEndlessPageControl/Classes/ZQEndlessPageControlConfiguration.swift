import Foundation
import UIKit

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
    /// 当前选中展示图片
    var selectedIndicatorImage: UIImage?
    /// 当前未选中展示图片
    var unselectedIndicatorImage: UIImage?
    
    public init(
        numberOfDots: Int,
        maxNumberOfDots: ZQEndlessPageControlMaxNumberOfDots = .five,
        selectedDotColor: UIColor = UIColor.white.withAlphaComponent(0.95),
        unselectedDotColor: UIColor = UIColor.white,
        dotSize: CGFloat = 8,
        spacing: CGFloat = 6,
        unselectedScale: CGFloat = 0.75,
        selectedScale: CGFloat = 1.0,
        smallScale: CGFloat = 0.5,
        dotBorderColor: UIColor? = nil,
        selectedIndicatorImage: UIImage? = nil,
        unselectedIndicatorImage: UIImage? = nil
    ) {
        self.numberOfDots = numberOfDots
        self.maxNumberOfDots = maxNumberOfDots
        self.selectedDotColor = selectedDotColor
        self.unselectedDotColor = unselectedDotColor
        self.dotSize = dotSize
        self.spacing = spacing
        self.unselectedScale = unselectedScale
        self.selectedScale = selectedScale
        self.smallScale = smallScale
        self.dotBorderColor = dotBorderColor
        self.selectedIndicatorImage = selectedIndicatorImage
        self.unselectedIndicatorImage = unselectedIndicatorImage
    }
}

extension ZQEndlessPageControlConfiguration: Equatable {
    
}
