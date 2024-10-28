//
//  File.swift
//  
//
//  Created by HOA on 2024/9/9.
//

import Foundation

public let imageBundle = Bundle.myModule
private class CurrentBundleFinder {}
extension Foundation.Bundle {
    static var myModule: Bundle = {
        .init(path: "Sources/Assets/assets.xcassets") ?? .main
    }()
}
