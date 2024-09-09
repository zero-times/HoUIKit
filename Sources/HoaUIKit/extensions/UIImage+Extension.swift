//
//  UIImage+Extension.swift
//  
//
//  Created by HOA on 2024/9/9.
//

import UIKit

public extension UIImage {

    static public func roundedImage(color: UIColor, size: CGSize, cornerRadius: CGFloat) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let roundedRect = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            
            color.setFill()
            roundedRect.fill()
        }
        return image.withRenderingMode(.alwaysOriginal)
    }

}
