//
//  SPCCommonSectionView.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/7.
//  Copyright © 2024 skyworth. All rights reserved.
//

import UIKit
import SnapKit

/// 默认容器颜色
fileprivate let defaultContentViewColor = UIColor.Palette.secondaryBackgroundColor
/// 默认容器圆角
fileprivate let defaultContentViewCornerRadius: CGFloat = 12
//  默认边距
fileprivate let defaultInset: UIEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)

public class HoCommonSectionView: UIView {

    //MARK:- 属性 -
    
    // 头
    let header: HoCommonTitleHeader?
    
    // 子视图
    let childrenView: [UIView]
    
    public override var isHidden: Bool {
        set {
            if newValue {
                header?.updateViewShow(isShow: false)
                childrenView.forEach { v in
                    if let v = v as? HoCommonFullTextRowView {
                        v.updateViewShow(isShow: false)
                    }
                    else if let v = v as? HoCommonDefaultRowView {
                        v.updateViewShow(isShow: false)
                    }
                    else {
                        v.isHidden = newValue
                    }
                }
            }
            else {
                header?.updateViewShow(isShow: true)
                childrenView.forEach { v in
                    if let v = v as? HoCommonFullTextRowView {
                        v.updateViewShow(isShow: true)
                    }
                    else if let v = v as? HoCommonDefaultRowView {
                        v.updateViewShow(isShow: true)
                    }
                    else {
                        v.isHidden = newValue
                    }
                }
            }
            
            super.isHidden = newValue
        }
        get {
            super.isHidden
        }
    }
    
    public init(header: HoCommonTitleHeader?, childrenView: [UIView]) {
        guard childrenView.count > 0 else {
            fatalError("childrenView.count should > 0")
        }
        self.header = header
        self.childrenView = childrenView
        super.init(frame: .zero)
        setupUI()
        layoutUI()
    }
    
    public func updateUI() {
        
        let displayChildrens = childrenView.filter { v in
            v.isHidden == false
        }
        if childrenView.count == 1 {
            if let first = childrenView.first {
                contentView.isHidden = first.isHidden
            }
        }
        else if displayChildrens.count == 0 {
            contentView.isHidden = true
        }
        else {
            contentView.isHidden = false
        }
                
        insetContentView.snp.updateConstraints { make in
            if isSpecificSingleRow(displayChildrens) {
                make.top.equalTo(4)
                make.bottom.equalTo(-4)
            }
            else {
                make.top.equalTo(2)
                make.bottom.equalTo(-2)
            }
        }
    }
    
    // 刷新分割线状态
    public func updatedividingLine() {
        
        // reset line
        func resetLineTo(_ isHidden: Bool) {
            childrenView.enumerated().forEach { index, v in
                let isHidden = v.isHidden
                let dividingLine = contentView.viewWithTag(index + 100)
                dividingLine?.isHidden = isHidden
            }
        }
        resetLineTo(false)
        
        let displayChildrens = childrenView.filter { v in
            v.isHidden == false
        }
        
        if childrenView.count == 1 {
            let dividingLine = contentView.viewWithTag(100)
            dividingLine?.isHidden = true
        }
        
        else if displayChildrens.count == 1 && childrenView.count > 1 {
            
            if let first = displayChildrens.first, let index = childrenView.firstIndex(of: first) {
                
                let dividingLine = contentView.viewWithTag(index + 100)
                dividingLine?.isHidden = true
                
            }
            
        }
        
        else  {
            
            guard let last = displayChildrens.last else { return }
            
            childrenView.enumerated().forEach { index, v in
                
                let dividingLine = contentView.viewWithTag(index + 100)
                if last == v {
                    dividingLine?.isHidden = true
                }
                else if displayChildrens.contains(v) == false {
                    dividingLine?.isHidden = true
                }
                
            }
            
        }
        
        
    }
    
    // 容器视图
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = defaultContentViewColor
        contentView.layer.cornerRadius = defaultContentViewCornerRadius
        contentView.clipsToBounds = true
        return contentView
    }()
    
    // 子容器
    private lazy var insetContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    public func setOverlay() {
        contentView.alpha = 0.38
    }
    
    // 分割线
    private func getBottomLineView() -> UILabel {
        let separatorLine = UILabel()
        separatorLine.backgroundColor = .Theme.dividingLine
        return separatorLine
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图初始化
    private func setupUI() {
         
        backgroundColor = .clear
        
        if let header = header {
            self.addSubview(header)
        }
        self.addSubview(contentView)
        
        contentView.addSubview(insetContentView)
        
        childrenView.forEach { child in
            insetContentView.addSubview(child)
        }
    }
    
    
    private func isSpecificSingleRow(_ views: [UIView]) -> Bool {
        if views.count == 1 {
            if let v = childrenView.first as? HoCommonDefaultRowView {
                switch v.subTitleStyle {
                case .left:
                    return false
                default:
                    if v.leftSubTitle.tag == 100 { // 特殊处理
                        return false
                    }
                    return true
                }
            }
//            if let v = views.first as? HoCommonSwitchRowView, v.leftSubTitle.isHidden {
//                return true
//            }
        }
        return false
    }
    
    // MARK: - 视图布局
    private func layoutUI() {
        
        header?.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(48)
        }
        
        contentView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(defaultInset.left)
            make.bottom.equalToSuperview().offset(-defaultInset.bottom)
            make.right.equalToSuperview().offset(-defaultInset.right)
            if let header = header {
                make.top.equalTo(header.snp.bottom).offset(defaultInset.top)
            }
            else {
                make.top.equalToSuperview().offset(defaultInset.top)
            }
        }
        
        insetContentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            if isSpecificSingleRow(childrenView) {
                make.top.equalTo(4)
                make.bottom.equalTo(-4)
            }
            else {
                make.top.equalTo(2)
                make.bottom.equalTo(-2)
            }
        }
        
        if childrenView.count == 1 {
            
            let child = childrenView.first!
            child.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            return
        }
        
        
        for childIndex in 0..<childrenView.count {
            let child = childrenView[childIndex]
            if isFirstChild(childIndex, childrenView: childrenView) {
                child.snp.makeConstraints { make in
                    make.left.top.right.equalToSuperview()
                }
                // 添加分割线
                addBottomLineInView(child, tag: childIndex + 100)
            }
            else if isLastChild(childIndex, childrenView: childrenView) {
                let previousChild = childrenView[childIndex-1]
                child.snp.makeConstraints { make in
                    make.left.bottom.right.equalToSuperview()
                    make.top.equalTo(previousChild.snp.bottom)
                }
//                addBottomLineInView(child, tag: childIndex + 100)
            }
            else {
                let previousChild = childrenView[childIndex-1]
                child.snp.makeConstraints { make in
                    make.left.right.equalToSuperview()
                    make.top.equalTo(previousChild.snp.bottom)
                }
                addBottomLineInView(child, tag: childIndex + 100)
            }
        }
        
    }
    
    // 第一个视图
    private func isFirstChild(_ index: Int, childrenView: [UIView]) -> Bool {
        childrenView[index] == childrenView.first
    }
    
    // 最后一个视图
    private func isLastChild(_ index: Int, childrenView: [UIView]) -> Bool {
        childrenView[index] == childrenView.last
    }
    
    // MARK: - 添加分割线
    // Tag: 分割线标记 用于处理隐藏显示
    private func addBottomLineInView(_ view: UIView, tag: Int) {
        let line = getBottomLineView()
        line.tag = tag
        contentView.addSubview(line)
        line.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(1)
            make.top.equalTo(view.snp.bottom)
        }
    }
}

