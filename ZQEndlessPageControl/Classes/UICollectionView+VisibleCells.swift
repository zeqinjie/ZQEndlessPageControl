import Foundation
import UIKit
extension UICollectionView {
    func endless_getAllVisibleCellsAndPaths() -> [(cell: ZQEndlessPageControlIndicatorCell, indexPath: IndexPath)] {
        let visibleCells = self.visibleCells
        let cellAndPaths: [(cell: ZQEndlessPageControlIndicatorCell, indexPath: IndexPath)] = visibleCells.compactMap { cell in
            guard let indexPath = self.indexPath(for: cell) else {
                return nil
            }
            
            guard let EndlessPageControlIndicatorCell = cell as? ZQEndlessPageControlIndicatorCell else {
                return nil
            }
            
            return (EndlessPageControlIndicatorCell, indexPath)
        }.sorted(by: {
            return $0.indexPath.row < $1.indexPath.row
        })
        return cellAndPaths
    }
}
