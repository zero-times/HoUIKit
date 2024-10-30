//
//  SPCCommonActionButton.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/14.
//  Copyright © 2024 skyworth. All rights reserved.
//

import UIKit

///  按钮类型
public enum HoCommonActionButtonType {
    
    // 强调，普通，警示
    case emphasis, normal, warning
 
    case none
}

public class HoCommonActionButton: UIButton {

    
    fileprivate let gSize: CGSize
    
    public init(_ size: CGSize = CGSize(width:  (UIDevice.current.userInterfaceIdiom == .pad ? (375 - 60) : min(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height) - 60) / 2, height: 44)) {
        self.gSize = size
        self.type = .none
        super.init(frame: .zero)
        self.titleLabel?.font = .designKit.systemFont(ofSize: 16, weight: .bold)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
    }
    
    private let type: HoCommonActionButtonType
    
    public init(_ type: HoCommonActionButtonType, size: CGSize = CGSize(width:  (UIDevice.current.userInterfaceIdiom == .pad ? (375 - 60) : UIScreen.main.bounds.size.width - 60) / 2, height: 44)) {
        self.gSize = size
        self.type = type
        super.init(frame: .zero)
        self.titleLabel?.font = .designKit.systemFont(ofSize: 16, weight: .medium)
        
        switch type {
        case .emphasis:
            setEmphasisStyle()
            break
        case .normal:
            setNormalStyle()
            break
        case .warning:
            setWarningStyle()
            break
        case .none:
            break
        }
    }
    
    
    private func setEmphasisStyle() {
        let titleColor: UIColor = .white
        let backgroundColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1), dark: UIColor(rgbValue: 0x3D7FFF, alpha: 1))
        let blackAlpha10 = UIColor.black
        let highlightBackgroundColor: UIColor = backgroundColor.blended(with: blackAlpha10, ratio: 0.1)
        let disableBackgroundColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 0.38), dark: UIColor(rgbValue: 0x3D7FFF, alpha: 0.38))
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColor, for: .highlighted)
        setTitleColor(titleColor, for: .disabled)
        setBackgroundColor(backgroundColor, for: .normal)
        setBackgroundColor(highlightBackgroundColor, for: .highlighted)
        setBackgroundColor(disableBackgroundColor, for: .disabled)
    }
    
    
    private func setNormalStyle() {
        let backgroundColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.05), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.1))
        let blackAlpha5 = UIColor.black
        let highlightBackgroundColor: UIColor = backgroundColor.blended(with: blackAlpha5, ratio: 0.05)
        let titleColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1), dark: UIColor(rgbValue: 0x5790FF, alpha: 1))
        let disableTitleColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 0.38), dark: UIColor(rgbValue: 0x5790FF, alpha: 0.38))
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColor, for: .highlighted)
        setTitleColor(disableTitleColor, for: .disabled)
        setBackgroundColor(backgroundColor, for: .normal)
        setBackgroundColor(highlightBackgroundColor, for: .highlighted)
        setBackgroundColor(backgroundColor, for: .disabled)
    }
    
    private func setWarningStyle() {
        let backgroundColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.05), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.1))
        let blackAlpha5 = UIColor.black
        let highlightBackgroundColor: UIColor = backgroundColor.blended(with: blackAlpha5, ratio: 0.05)
        let titleColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0xEA3C37, alpha: 1), dark: UIColor(rgbValue: 0xD93A34, alpha: 1))
        let disableTitleColor: UIColor = .dynamicColor(light: UIColor(rgbValue: 0xEA3C37, alpha: 0.38), dark: UIColor(rgbValue: 0xD93A34, alpha: 0.38))
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColor, for: .highlighted)
        setTitleColor(disableTitleColor, for: .disabled)
        setBackgroundColor(backgroundColor, for: .normal)
        setBackgroundColor(highlightBackgroundColor, for: .highlighted)
        setBackgroundColor(backgroundColor, for: .disabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setBackgroundColor(_ color: UIColor?, cornerRadius: CGFloat = 22, for state: UIControl.State) {
        let backgroundImage = UIImage.roundedImage(color: color ?? .clear, size: gSize, cornerRadius: cornerRadius)
        self.setBackgroundImage(backgroundImage, for: state)
    }

}
