//
//  SPCCommonDisplayProtocol.swift
//  SkyPiCameraiOSProject
//
//  Created by HOA on 2024/5/27.
//  Copyright © 2024 skyworth. All rights reserved.
//

import UIKit

public protocol HoCommonDisplayProtocol {
    
    func updateViewShow(isShow: Bool)
    
}

/// 置灰协议
public protocol HoCommonOverlayProtocol {
    
    func setupOverlay()
    
}
