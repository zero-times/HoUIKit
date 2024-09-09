//
//  SPCCommonTitleHeader.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/6.
//  Copyright © 2024 skyworth. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class HoCommonTitleHeader: UIView {
    //MARK:- 属性 -
    //标题
    public lazy var title: UILabel = {
        let title = UILabel()
        title.text = ""
        title.textColor = .dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.6), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.6))
        title.font = UIFont.designKit.systemFont(ofSize: 14, weight: .medium)
        title.adjustsFontForContentSizeCategory = true
        return title
    }()
    
    public func updateViewShow(isShow: Bool) {
        self.isHidden = !isShow;
        
        if isShow {
            title.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(24)
                make.top.equalTo(14)
                make.bottom.equalToSuperview()
            }
        }
        else {
            title.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(0)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        addSubview(title)
        
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(14)
            make.bottom.equalToSuperview()
        }
    }
}
