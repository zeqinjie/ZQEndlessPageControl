import Foundation

protocol ZQEndlessPageControlIndicatorCellProtocol {
    var isSelected: Bool {  get set }
    func update(state: ZQEndlessPageControlIndicatorCellState, animated: Bool)
    func set(configuration: ZQEndlessPageControlConfiguration)
}
