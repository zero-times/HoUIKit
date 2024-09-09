// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
#if canImport(SnapKit)

import SnapKit

#endif

#if canImport(UIKit)

import UIKit

#endif

public class TTOB: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    
    func initViews() {
        
        let view = UIView()
        view.backgroundColor = .red
        addSubview(view)
        view.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
