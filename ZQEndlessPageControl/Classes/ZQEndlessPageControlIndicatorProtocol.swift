import Foundation

public protocol ZQEndlessPageControlIndicatorProtocol {
    var selectedIndex: Int { get set }
    func setup(with configuration: ZQEndlessPageControlConfiguration)
}
