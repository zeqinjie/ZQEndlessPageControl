import Foundation
import UIKit

public protocol ZQEndlessPageControlIndicatorCellProtocol where Self: UICollectionViewCell {
    /// 设置选中与否
    var isSelected: Bool {  get set }
    /// 更新状态
    func update(state: ZQEndlessPageControlIndicatorCellState, animated: Bool)
    /// 设置配置
    func set(configuration: ZQEndlessPageControlConfiguration)
}
