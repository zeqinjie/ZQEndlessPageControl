//
//  ZQEndlessPageControlIndicatorDelegate.swift
//  ZQEndlessPageControl
//
//  Created by zhengzeqin on 2021/9/27.
//

import UIKit
import Foundation

public protocol ZQEndlessPageControlIndicatorDelegate: class {
    
    /// 注册自定义 cell
    func registerCell() -> UICollectionViewCell.Type
    
    /// 自定义 cell
    func customCellClass<T: ZQEndlessPageControlIndicatorCellProtocol>(_ indicator: ZQEndlessPageControlIndicator) -> T
    
    /// 设置 cell
    func setupCustomCell(_ cell: UICollectionViewCell, indexPath: IndexPath, indicator: ZQEndlessPageControlIndicator)
}

