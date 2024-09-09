//
//  SPCCommonCheckRowView.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/14.
//  Copyright © 2024 skyworth. All rights reserved.
//

import UIKit
import SnapKit

//单选类型
public class HoCommonCheckRowView: UIControl {
    
    //MARK:- 属性 -
    
    let title: String
    var subtitle: String
    
    public override var isSelected: Bool {
        didSet {
            self.checkButton.isEnabled = isSelected
        }
    }
    
    public init(_ title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        setupUI()
        layoutViews()
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
    
    public lazy var leftSubTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.designKit.systemFont(ofSize: 14)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.6), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.6))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text = subtitle
        return label
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        return view
    }()
    
    //MARK: 选中框
    public lazy var checkButton: UIButton = {
        let checkButton = UIButton()
        let disableImage = UIImage(named: "single_check", in: .myModule, compatibleWith: nil)
        let normalImage = UIImage(named: "single_is_selected", in: .myModule, compatibleWith: nil)
        checkButton.setImage(disableImage, for: .disabled)
        checkButton.setImage(normalImage, for: .normal)
        return checkButton
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
    
    // 隐藏副标题
    public func hiddenSubtitle() {
        self.leftSubTitle.isHidden = true
        self.leftTitle.snp.remakeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(12)
            make.bottom.equalTo(-12)
            make.height.greaterThanOrEqualTo(24)
            make.right.equalTo(checkButton.snp.left).offset(-16)
        }
        container.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.height.greaterThanOrEqualTo(48)
        }
    }
    
    //MARK:- Private Methods -
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.addSubview(container)
        
        container.addSubview(leftTitle)
        container.addSubview(leftSubTitle)
        container.addSubview(checkButton)
    }
    
    private func layoutViews() {
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.greaterThanOrEqualTo(64)
        }
        
        leftTitle.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(12)
        }
        
        leftSubTitle.snp.makeConstraints { make in
            make.left.equalTo(leftTitle)
            make.top.equalTo(leftTitle.snp.bottom).offset(2)
            make.bottom.equalTo(-12)
            make.right.equalTo(checkButton.snp.left).offset(-16)
        }
        
        checkButton.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
    }
}

extension HoCommonCheckRowView: HoCommonDisplayProtocol {
    
    public func updateViewShow(isShow: Bool) {
        self.isHidden = !isShow;
        
        if isShow {
            container.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                if self.leftSubTitle.isHidden {
                    make.height.equalTo(48)
                }
                else {
                    make.height.greaterThanOrEqualTo(64)
                }
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
