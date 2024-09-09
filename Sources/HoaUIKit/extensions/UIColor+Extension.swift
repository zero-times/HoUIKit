//
//  UIColor+Extension.swift
//

import Foundation

#if canImport(UIKit)

import UIKit

#endif

@objc
public extension UIColor {
    
    enum Palette {
        public static let primary: UIColor = dynamicColor(light: UIColor(rgbValue: 0x0770e3), dark: UIColor(rgbValue: 0x6d9feb))
        
        public static let backgroundColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0xF2F3F6), dark: .black)
        public static let secondaryBackgroundColor: UIColor = dynamicColor(light: .white, dark: UIColor(rgbValue: 0x202022))
        public static let tertiaryBackgroundbackgroundColor: UIColor = dynamicColor(light: .white, dark: UIColor(rgbValue: 0x2C2C2E))
        
        public static let primaryTextColor: UIColor = dynamicColor(light: UIColor(white: 0, alpha: 0.9), dark: UIColor(white: 1, alpha: 0.86))
        public static let secondaryTextColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x68697f), dark: UIColor(rgbValue: 0x8E8E93))
        public static let tertiaryTextColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x8f90a0), dark: UIColor(rgbValue: 0x8E8E93))
        public static let quaternaryTextColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0xb2b2bf), dark: UIColor(rgbValue: 0x8E8E93))
    }
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
        } else {
            return light
        }
    }
    
    /// 主题颜色
    enum Theme {
        
        /// 系统高亮色
        public static let systemHighlighted: UIColor = dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1.0), dark: UIColor(rgbValue: 0x3D7FFF, alpha: 1.0))

        /// 文本高亮色
        public static let textHighlighted: UIColor = dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1.0), dark: UIColor(rgbValue: 0x5790FF, alpha: 1.0))

        /// 一级文本
        public static let primaryText: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.9), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.86))

        /// 二级文本
        public static let secondaryText: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.6), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.6))
        
        /// 三级文本
        public static let tertiaryText: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.38), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.38))
        
        /// 图标高亮色
        public static let iconHighlighted: UIColor = dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1.0), dark: UIColor(rgbValue: 0x3D7FFF, alpha: 1.0))

        /// 一级图标色
        public static let primaryIconColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.9), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.86))

        /// 二级图标
        public static let secondaryIconColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.6), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.6))
        
        /// 三级图标色
        public static let tertiaryIconColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.38), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.38))
        
        /// 四级图标色
        public static let quaternaryIconColor: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.20), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.30))
        
        /// 分割线
        public static let dividingLine: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.20), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.20))
        

    }
    
    /// 背景色
    enum Background {
        
        ///  主背景色
        public static let primary: UIColor = dynamicColor(light: UIColor(rgbValue: 0xF2F3F6, alpha: 1.0), dark: UIColor(rgbValue: 0x000000, alpha: 1.0))
        
        ///  列表卡片背景色
        public static let listCard: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFFFFFF, alpha: 1.0), dark: UIColor(rgbValue: 0x202022, alpha: 1.0))
        
        ///  卡片背景色
        public static let card: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFFFFFF, alpha: 1.0), dark: UIColor(rgbValue: 0x202022, alpha: 1.0))
        
        ///  弹框背景色
        public static let popupBox: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFFFFFF, alpha: 1.0), dark: UIColor(rgbValue: 0x2E2E2E, alpha: 1.0))
        
        ///  弹框蒙黑
        public static let popupMask: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.20), dark: UIColor(rgbValue: 0x000000, alpha: 0.40))
        
        ///  按钮背景色
        public static let buttonBackground: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.05), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.10))
        
        ///  点击效果背景色（叠加）
        public static let clickEffectBackground: UIColor = dynamicColor(light: UIColor(rgbValue: 0x000000, alpha: 0.05), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.10))
        
        ///  列表卡片点击效果背景色
        public static let  listCardClickEffectBackground: UIColor = dynamicColor(light: UIColor(rgbValue: 0x475170, alpha: 0.10), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.10))
        
        ///  即时反馈背景色
        public static let instantFeedbackBackground: UIColor = dynamicColor(light: UIColor(rgbValue: 0xD9D9D9, alpha: 0.95), dark: UIColor(rgbValue: 0x404040, alpha: 1.0))
        
        ///  气泡提示背景色
        public static let bubblePromptsBackground: UIColor = dynamicColor(light: UIColor(rgbValue: 0x4D4D4D, alpha: 0.10), dark: UIColor(rgbValue: 0xFFFFFF, alpha: 0.10))
    }
    
    /// 功能色
    enum Functional {
        
        ///  警告色
        public static let warning: UIColor = dynamicColor(light: UIColor(rgbValue: 0xEA3C37, alpha: 1.0), dark: UIColor(rgbValue: 0xD93A34, alpha: 1.0))
        
        ///  警示色1
        public static let warning1: UIColor = dynamicColor(light: UIColor(rgbValue: 0xF46629, alpha: 1.0), dark: UIColor(rgbValue: 0xEB642A, alpha: 1.0))
        
        ///  警示色2
        public static let warning2: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFFC803, alpha: 1.0), dark: UIColor(rgbValue: 0xF2BE00, alpha: 1.0))
        
        ///  安全色
        public static let security: UIColor = dynamicColor(light: UIColor(rgbValue: 0x15C252, alpha: 1.0), dark: UIColor(rgbValue: 0x15B34C, alpha: 1.0))
        
        ///  默认头像圆形底板色
        public static let defaultAvatarCircularBase: UIColor = dynamicColor(light: UIColor(rgbValue: 0xCCCCCC, alpha: 1.0), dark: UIColor(rgbValue: 0x616161, alpha: 1.0))
        
        ///  默认头像内部的人形图标
        public static let defaultHumanIconInsideTheAvatar: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFFFFFF, alpha: 1.0), dark: UIColor(rgbValue: 0xA8A8A8, alpha: 1.0))
        
        ///  超链接文本色
        public static let hyperlinkText: UIColor = dynamicColor(light: UIColor(rgbValue: 0x256FFF, alpha: 1.0), dark: UIColor(rgbValue: 0x5790FF, alpha: 1.0))
        
    }
    
    /// 系统多彩色
    enum SystemMulti {
        
        ///  多彩色1
        public static let multiColor1: UIColor = dynamicColor(light: UIColor(rgbValue: 0x1587FF, alpha: 1.0), dark: UIColor(rgbValue: 0x2286F0, alpha: 1.0))
        
        ///  多彩色2
        public static let multiColor2: UIColor = dynamicColor(light: UIColor(rgbValue: 0x00AAEE, alpha: 1.0), dark: UIColor(rgbValue: 0x009FDE, alpha: 1.0))
        
        ///  多彩色3
        public static let multiColor3: UIColor = dynamicColor(light: UIColor(rgbValue: 0x00BEC8, alpha: 1.0), dark: UIColor(rgbValue: 0x14ABB3, alpha: 1.0))
        
        ///  多彩色4
        public static let multiColor4: UIColor = dynamicColor(light: UIColor(rgbValue: 0x15C252, alpha: 1.0), dark: UIColor(rgbValue: 0x15B34C, alpha: 1.0))
        
        ///  多彩色5
        public static let multiColor5: UIColor = dynamicColor(light: UIColor(rgbValue: 0x91D418, alpha: 1.0), dark: UIColor(rgbValue: 0x77B010, alpha: 1.0))
        
        ///  多彩色6
        public static let multiColor6: UIColor = dynamicColor(light: UIColor(rgbValue: 0x8455F2, alpha: 1.0), dark: UIColor(rgbValue: 0x7243E0, alpha: 1.0))
        
        ///  多彩色7
        public static let multiColor7: UIColor = dynamicColor(light: UIColor(rgbValue: 0xE33089, alpha: 1.0), dark: UIColor(rgbValue: 0xCD2C7D, alpha: 1.0))
        
        ///  多彩色8
        public static let multiColor8: UIColor = dynamicColor(light: UIColor(rgbValue: 0xEA3C37, alpha: 1.0), dark: UIColor(rgbValue: 0xD93A34, alpha: 1.0))
        
        ///  多彩色9
        public static let multiColor9: UIColor = dynamicColor(light: UIColor(rgbValue: 0xF46629, alpha: 1.0), dark: UIColor(rgbValue: 0xEB642A, alpha: 1.0))
        
        ///  多彩色10
        public static let multiColor10: UIColor = dynamicColor(light: UIColor(rgbValue: 0xFF9700, alpha: 1.0), dark: UIColor(rgbValue: 0xF08E05, alpha: 1.0))
    }
}

public extension UIColor {
    convenience init(rgbValue: Int, alpha: CGFloat = 1.0) {
        let components = (
                R: CGFloat((rgbValue >> 16) & 0xff) / 255,
                G: CGFloat((rgbValue >> 08) & 0xff) / 255,
                B: CGFloat((rgbValue >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
}

extension UIColor {
    // 混合两种颜色，参数 ratio 用于指定混合比例，取值范围为 0.0 到 1.0
    func blended(with color: UIColor, ratio: CGFloat) -> UIColor {
        let ratio = max(0, min(1, ratio)) // 确保 ratio 在 0 到 1 的范围内
        let invRatio = 1 - ratio
        
        var r1: CGFloat = 0
        var g1: CGFloat = 0
        var b1: CGFloat = 0
        var a1: CGFloat = 0
        var r2: CGFloat = 0
        var g2: CGFloat = 0
        var b2: CGFloat = 0
        var a2: CGFloat = 0
        
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        let r = r1 * invRatio + r2 * ratio
        let g = g1 * invRatio + g2 * ratio
        let b = b1 * invRatio + b2 * ratio
        let a = a1 * invRatio + a2 * ratio
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
