import Foundation

public protocol ZQEndlessPageControlIndicatorProtocol {
    /// 设置选择下标
    var selectedIndex: Int { get set }
    /// 配置
    func setup(configuration: ZQEndlessPageControlConfiguration)
}
