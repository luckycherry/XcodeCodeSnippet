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

/*
 UIKit + RxSwift 团队开发规范：
 1. 【属性声明】：使用 lazy var 闭包，仅处理外观、颜色、字体等样式，不写交互逻辑。
 2. 【布局分离】：在 Layout 扩展中实现 configSubviews(), setupSubviews() 和 measureSubviews()。
 3. 【逻辑绑定】：在 Bindings 扩展中实现 bindValues() 和 bindInteractions()。
 4. 【调用顺序】：viewDidLoad 中：uiConfig() -> configSubviews() -> bindValues() -> bindInteractions()。
 5. 【属性持有标准】：UI 元素满足以下任一条件时声明为成员属性，否则在 setupSubviews() 中作为局部变量创建：
    - 需要绑定数据（bindValues 中引用）
    - 需要绑定交互（bindInteractions 中引用）
    - 需要运行时动态修改（文本、颜色、隐藏/显示、约束等）
    静态装饰性视图（分割线、固定标题、背景图、固定 icon 等）不持有，直接在 setupSubviews() 中创建即可。
 */

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
