//
//  SPCCommonDefaultRowView.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/8.
//  Copyright © 2024 skyworth. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class HoCommonDefaultRowView: UIControl {
    
    public enum SubTitleStyle: Equatable {
        // 无
        case none
        // 左
        case left(_ text: String)
        // 右
        case right(_ text: String)
        // 右且无箭头
        case rightAndNoneArrow(_ text: String)
    }
    //MARK:- 属性 -
    
    let title: String
    var subTitleStyle: SubTitleStyle
    
    public init(_ title: String, subTitleStyle: SubTitleStyle = .none) {
        self.title = title
        self.subTitleStyle = subTitleStyle
        super.init(frame: .zero)
        setupUI()
        layoutViews()
        updateSubtitleUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var leftTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.designKit.systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.dynamicColor(light: UIColor(white: 0, alpha: 0.9), dark: UIColor(white: 1, alpha: 0.86))
        label.text = title
        return label
    }()
    
    lazy var flagView: UILabel = {
        let flagView = UILabel()
        flagView.backgroundColor = UIColor.Functional.warning
        flagView.isEnabled = false
        flagView.isHidden = true
        flagView.layer.masksToBounds = true
        flagView.layer.cornerRadius = 3.0
        return flagView
    }()
    
    public lazy var leftSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.designKit.systemFont(ofSize: 14)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.6), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.6))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        switch subTitleStyle {
        case .none:
            break
        case .left(let text):
            label.text = text
        case .right(let text):
            label.text = text
        case .rightAndNoneArrow(let text):
            label.text = text
        }
        return label
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var rightArrow: UIImageView = {
        let image = UIImage.init(named: "set_icon_arrow")
        let rightArrow = UIImageView(image: image)
        rightArrow.contentMode = .scaleAspectFit
        return rightArrow
    }()
    
    //MARK:- Public Methods -
    
    //是否可用
    public var enable: Bool = true {
        didSet{
            self.isUserInteractionEnabled = enable
            if enable {
                self.leftTitle.textColor = UIColor.init(rgbValue: 0x333333)
            } else {
                self.leftTitle.textColor = UIColor.lightGray
            }
        }
    }
    
    //MARK:- Private Methods -
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.addSubview(container)
        
        container.addSubview(leftTitle)
        container.addSubview(flagView)
        container.addSubview(leftSubTitle)
        container.addSubview(rightArrow)
    }
    
    private func layoutViews() {
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftTitle.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(12)
            make.height.equalTo(24)
        }
        
        let titleWidth = leftTitle.text?.getStringWidth(font: leftTitle.font) ?? 0
        flagView.snp.makeConstraints { make in
            make.left.equalTo(leftTitle.snp.left).offset(titleWidth+8)
            make.centerY.equalTo(leftTitle)
            make.width.height.equalTo(6)
        }
        
        leftSubTitle.snp.makeConstraints { make in
            make.left.equalTo(leftTitle)
            make.top.equalTo(leftTitle.snp.bottom).offset(2)
            make.bottom.equalTo(-12-4)
            make.right.equalTo(rightArrow.snp.left).offset(-8)
        }
        
        rightArrow.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.centerY.equalToSuperview()
            make.width.equalTo(12)
            make.height.equalTo(24)
        }
        
        if case HoCommonDefaultRowView.SubTitleStyle.none = subTitleStyle {
            leftTitle.snp.remakeConstraints { make in
                make.left.equalTo(12)
                make.top.equalTo(12)
                make.height.greaterThanOrEqualTo(24)
                make.bottom.equalTo(-12)
            }
        }
    }
    
    private func updateSubtitleUI() {
        
        switch subTitleStyle {
        case .none:
            leftSubTitle.removeFromSuperview()
            leftTitle.snp.remakeConstraints { make in
                make.left.equalTo(12)
                make.top.equalTo(12)
                make.height.greaterThanOrEqualTo(24)
                make.bottom.equalTo(-12)
                make.right.equalTo(rightArrow.snp.left).offset(-8)
            }
        case .left:
            break
        case .right:
            leftTitle.snp.remakeConstraints { make in
                make.left.equalTo(12)
                make.top.equalTo(0)
                make.height.greaterThanOrEqualTo(48)
                make.bottom.equalTo(0)
            }
            leftSubTitle.textAlignment = .right
            leftSubTitle.snp.remakeConstraints { make in
                make.left.equalTo(leftTitle.snp.right).offset(16)
                make.right.equalTo(rightArrow.snp.left).offset(-4)
                make.top.equalTo(12)
                make.bottom.equalTo(-12)
            }
        case .rightAndNoneArrow:
            rightArrow.isHidden = true
            leftSubTitle.textAlignment = .right
            leftTitle.snp.remakeConstraints { make in
                make.left.equalTo(12)
                make.top.equalTo(0)
                make.height.greaterThanOrEqualTo(48)
                make.bottom.equalTo(0)
            }
            leftSubTitle.snp.remakeConstraints { make in
                make.left.equalTo(leftTitle.snp.right).offset(16)
                make.right.equalToSuperview().offset(-12)
                make.top.equalTo(12)
                make.bottom.equalTo(-12)
            }
        }
        
        self.layoutIfNeeded()
    }
}

// MARK: 扩展能力
// MARK: 显示隐藏
extension HoCommonDefaultRowView: HoCommonDisplayProtocol {
    
    public func updateViewShow(isShow: Bool) {
        self.isHidden = !isShow;
        
        if isShow {
            container.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        else {
            container.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(0)
            }
        }
    }
    
}

// MARK: 置灰 - 且不响应事件
extension HoCommonDefaultRowView: HoCommonOverlayProtocol {
    
    public func setupOverlay() {
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    func setupSelfOverlay() {
        setupOverlay()
        container.alpha = 0.38
    }
    
}
