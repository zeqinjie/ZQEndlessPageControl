import Foundation
import UIKit
extension UICollectionView {
    func endless_getAllVisibleCellsAndPaths() -> [(cell: ZQEndlessPageControlIndicatorCellProtocol, indexPath: IndexPath)] {
        let visibleCells = self.visibleCells
        let cellAndPaths: [(cell: ZQEndlessPageControlIndicatorCellProtocol, indexPath: IndexPath)] = visibleCells.compactMap { cell in
            guard let indexPath = self.indexPath(for: cell) else {
                return nil
            }
            
            guard let EndlessPageControlIndicatorCell = cell as? ZQEndlessPageControlIndicatorCellProtocol else {
                return nil
            }
            
            return (EndlessPageControlIndicatorCell, indexPath)
        }.sorted(by: {
            return $0.indexPath.row < $1.indexPath.row
        })
        return cellAndPaths
    }
}
