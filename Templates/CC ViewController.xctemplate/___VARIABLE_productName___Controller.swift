//
//  ___VARIABLE_productName___ViewController.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


class ___VARIABLE_productName___Controller: UIViewController {
    private let viewModel = ___VARIABLE_productName___ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configSubviews()
        configAction()
    }

}

// MARK: - Bindings (数据流与事件流)
extension ___VARIABLE_productName___Controller {
    // MARK: 绑定数据和视图交互
    private func configAction() {
        bindValues()
        bindInteractions()
    }
    // MARK: Value -> UI
    private func bindValues() {
        
    }
    // MARK: UI -> Action
    private func bindInteractions() {
        
    }
}

// MARK: - Layout (层级与约束)
extension ___VARIABLE_productName___Controller {
    // MARK: 层级与约束
    private func configSubviews() {
        setupSubviews()
        measureSubviews()
    }
    // MARK: 层级
    private func setupSubviews() {
        let subViews: [UIView] = [
            
        ]
        subViews.forEach { view.addSubview($0) }
    }
    // MARK: 约束
    private func measureSubviews() {
        
    }
}


