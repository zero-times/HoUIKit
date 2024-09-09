//
//  String+Extension.swift
//  
//
//  Created by HOA on 2024/9/9.
//

import UIKit
import Foundation

public extension String {
    
    //MARK:获取文本宽度
    func getStringWidth(maxSize: CGSize = CGSizeMake(UIScreen.main.bounds.size.width - 24, 100), font: UIFont) -> CGFloat {
        let tempString = self as NSString
        let contentSize: CGSize = tempString.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin],attributes: [NSAttributedString.Key.font:font], context: nil).size
        //向上取整,防止太小
        let width = ceil(contentSize.width)
        return width
    }
    
}
