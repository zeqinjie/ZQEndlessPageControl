//
//  ViewController.swift
//  ZQEndlessPageControl
//
//  Created by zhengzeqin on 09/23/2021.
//  Copyright (c) zhengzeqin All rights reserved.
//

import UIKit
import SnapKit

enum DemoHeaderListFuncCellType {
    /// demo
    case `default`
}


class ViewController: UIViewController {
    
    // MARK: - Private Property
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        return $0
    } (UITableView())
    
    /// 功能类型数组
    fileprivate let funcTypeArr: [DemoHeaderListFuncCellType] = [
        .`default`
    ]
    
    fileprivate let cellId = "CELLID"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.initUI()
    }
}

// MARK: - Private Method
extension ViewController {
    fileprivate func initUI() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.funcTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: self.cellId)
        }
        
        var cellTitle = "none"
        let funcType = self.funcTypeArr[indexPath.item]
        switch funcType {
        case .default:
            cellTitle = "default"
        }
        cell?.textLabel?.text = cellTitle
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController?
        let funcType = self.funcTypeArr[indexPath.item]
        switch funcType {
        case .default:
            vc = EndLessPageControlViewController()
        }
        guard let _vc = vc else { return }
        self.navigationController?.pushViewController(_vc, animated: true)
    }
}


