//
//  SPCCommonSliderRowView.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/7.
//  Copyright © 2024 skyworth. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class HoCommonSliderRowView: UIView {
    
    //MARK:- 属性 -
    
    public init() {
        super.init(frame: .zero)
        setupUI()
        layoutViews()
    }
    
    //是否可用
    public var enable: Bool = true {
        didSet{
            self.isUserInteractionEnabled = enable
            if enable {
                self.leftTitle.textColor = UIColor.Palette.primaryTextColor
                self.leftSubTitle.textColor = UIColor.Palette.secondaryTextColor
                self.slider.isEnabled = true
            } else {
                self.leftTitle.textColor = UIColor.lightGray
                self.leftSubTitle.textColor = .lightGray
                self.slider.isEnabled = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var leftTitle: HoSnpWidthLabel = {
        let label = HoSnpWidthLabel()
        label.font = UIFont.designKit.systemFont(ofSize: 16, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor.dynamicColor(light: UIColor(white: 0, alpha: 0.9), dark: UIColor(white: 1, alpha: 0.86))
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
        return label
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    public lazy var slider: UISlider = {
        let slider = UISlider()
        slider.tintColor =  UIColor.dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1), dark: UIColor(rgbValue: 0x5790FF, alpha: 1))
        slider.maximumValue = 10
        slider.setThumbImage(.init(named: "Knob"), for: .normal)
        return slider
    }()
    
    //MARK:- Public Methods -
    
    //MARK:- Private Methods -
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.addSubview(container)
        
        container.addSubview(leftTitle)
        container.addSubview(leftSubTitle)
        container.addSubview(slider)
    }
    
    private func layoutViews() {
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftTitle.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(12+4)
            make.height.equalTo(24)
            make.width.greaterThanOrEqualTo(48)
        }
        
        leftSubTitle.snp.makeConstraints { make in
            make.left.equalTo(leftTitle)
            make.top.equalTo(leftTitle.snp.bottom).offset(2)
            make.height.equalTo(14)
            make.bottom.equalTo(-12-4)
        }
        
        slider.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.centerY.equalToSuperview()
            make.left.equalTo(leftTitle.snp.right).offset(12)
        }
    }
}

extension HoCommonSliderRowView: HoCommonDisplayProtocol {
    
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
