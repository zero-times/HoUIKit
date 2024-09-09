//
//  UIFont+Extension.swift
//

import Foundation

#if canImport(UIKit)

import UIKit

#endif

public extension UIFont {
    static let designKit = DesignKitTypography()
    
    /// 符号化内容/重点数据/设备状态
    static var h: UIFont {
        designKit.systemFont(ofSize: 24, weight: .medium)
    }
    
    /// App bar标题栏/弹窗标题
    static var h1: UIFont {
        designKit.systemFont(ofSize: 20, weight: .medium)
    }
    
    /// 一级内容/设置项分组标题/卡片标题
    static var subtitle1: UIFont {
        designKit.systemFont(ofSize: 16, weight: .medium)
    }
    
    /// 二级内容/段落文本分组标题
    static var subtitle2: UIFont {
        designKit.systemFont(ofSize: 16, weight: .medium)
    }
    
    /// 内容区的大文本按钮
    static var button1: UIFont {
        designKit.systemFont(ofSize: 16, weight: .medium)
    }
    
    /// 列表内的小文本按钮
    static var button2: UIFont {
        designKit.systemFont(ofSize: 14, weight: .medium)
    }
    
    /// 列表正文/段落文本
    static var body1: UIFont {
        designKit.systemFont(ofSize: 16, weight: .regular)
    }
    
    /// 列表辅助文本/宫格描述文本/段落文本
    static var body2: UIFont {
        designKit.systemFont(ofSize: 14, weight: .regular)
    }
    
    /// 功能入口icon说明文本/段落文本
    static var body3: UIFont {
        designKit.systemFont(ofSize: 12, weight: .regular)
    }
    
    /// toolbar/tabbar描述文本/内容来源
    static var caption1: UIFont {
        designKit.systemFont(ofSize: 10, weight: .regular)
    }
    
    struct DesignKitTypography {
        func systemFont(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
            scaled(baseFont: .systemFont(ofSize: fontSize, weight: weight), forTextStyle: .body)
        }
        
        func systemFont(name fontName: String, size fontSize: CGFloat) -> UIFont {
            scaled(baseFont: UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize))
        }
    }
}

private extension UIFont.DesignKitTypography {
    func scaled(baseFont: UIFont, forTextStyle textStyle: UIFont.TextStyle = .body, maximumFactor: CGFloat? = nil) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        
        if let maximumFactor = maximumFactor {
            let maximumPointSize = baseFont.pointSize * maximumFactor
            return fontMetrics.scaledFont(for: baseFont, maximumPointSize: maximumPointSize)
        }
        return fontMetrics.scaledFont(for: baseFont)
    }
}
