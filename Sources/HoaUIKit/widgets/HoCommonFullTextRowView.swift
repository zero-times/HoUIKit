//
//  SPCCommonFullTextRowView.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/11.
//  Copyright © 2024 skyworth. All rights reserved.
//

import UIKit
import SnapKit

public class HoCommonFullTextRowView: UIControl {
    
    //MARK:- 属性 -
    
    let title: String
    let subtitle: String
    let detail: String
    
    public init(_ title: String, subtitle: String, detail: String) {
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
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
        label.text = subtitle
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var detailLabel: HoSnpWidthLabel = {
        let detailLabel = HoSnpWidthLabel()
        detailLabel.font = UIFont.designKit.systemFont(ofSize: 14)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.textColor = UIColor.Palette.secondaryTextColor
        detailLabel.text = detail
        detailLabel.textAlignment = .right
        return detailLabel
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var rightArrow: UIImageView = {
        let rightArrow = UIImageView(image: .init(named: "set_icon_arrow", in: .myModule, compatibleWith: nil))
        rightArrow.contentMode = .scaleAspectFit
        return rightArrow
    }()
    
    //MARK:- Public Methods -
    
    //是否可用
    public var enable: Bool = true {
        didSet{
            self.isUserInteractionEnabled = enable
            if enable {
                self.leftTitle.textColor = UIColor(rgbValue: 0x333333)
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
        container.addSubview(leftSubTitle)
        container.addSubview(rightArrow)
        container.addSubview(detailLabel)
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
            make.height.greaterThanOrEqualTo(14)
            make.right.equalTo(detailLabel.snp.left).offset(-16)
        }
        
        rightArrow.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.width.equalTo(12)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.right.equalTo(rightArrow.snp.left).offset(-4)
            make.width.greaterThanOrEqualTo(40)
            make.centerY.equalToSuperview()
        }
    }
}

extension HoCommonFullTextRowView: HoCommonDisplayProtocol {
    
    public func updateViewShow(isShow: Bool) {
        self.isHidden = !isShow
        
        if isShow {
            container.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.height.greaterThanOrEqualTo(64)
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
