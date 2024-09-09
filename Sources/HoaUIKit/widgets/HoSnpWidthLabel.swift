//
//  SPCSnpWidthLabel.swift
//  SKYIotFramework
//
//  Created by HOA on 2024/8/16.
//

import UIKit

/// 自适应宽
public class HoSnpWidthLabel: UILabel {
    
    // 设置宽的回调
    public var setWidthHandler: ((CGFloat) -> Void)?
    // 获取当前文本宽
    func getCurrentTextWidth() -> CGFloat {
        let width = textWidth(text: self.text ?? "", font: font)
        return width
    }
    
    public override var text: String? {
        didSet {
            updateWidth()
        }
    }
    
    func updateWidth() {
        let width = textWidth(text: self.text ?? "", font: font)
        self.snp.updateConstraints { make in
            make.width.greaterThanOrEqualTo(width)
        }
        setWidthHandler?(width)
    }
    
    func textWidth(text: String, font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}
