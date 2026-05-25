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


class ___VARIABLE_productName___ViewController: BaseVC {
    private let viewModel = ___VARIABLE_productName___ViewModel()

    // MARK: - UI Components (仅声明需要绑定/动态修改的控件)

    // MARK: - Lifecycle
    override func uiConfig() {
        super.uiConfig()
        configSubviews()
        bindValues()
        bindInteractions()
    }

    // MARK: - Business
}

// MARK: - Bindings (数据流与事件流)
extension ___VARIABLE_productName___ViewController {
    /// ViewModel -> UI
    private func bindValues() {

    }
    /// UI -> Action
    private func bindInteractions() {

    }
}

// MARK: - Layout (层级与约束)
extension ___VARIABLE_productName___ViewController {
    private func configSubviews() {
        setupSubviews()
        measureSubviews()
    }

    private func setupSubviews() {
        // 静态装饰性视图直接在这里创建为局部变量
        // 需要绑定/动态修改的控件通过成员属性引用
    }

    private func measureSubviews() {

    }
}
