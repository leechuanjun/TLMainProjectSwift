//
//  Target_TLAModule.swift
//  TLAModuleSwift
//
//  Created by lichuanjun on 2018/1/18.
//  Copyright © 2018年 lichuanjun. All rights reserved.
//

import UIKit

@objc(Target_TLAModule)
class Target_TLAModule: NSObject {

    @objc
    func Action_viewController(params:NSDictionary) -> UIViewController {
        
        let block = params["callback"]
        typealias CallbackType = @convention(block) (NSString) -> Void
        
        let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
        
        callback("success")
        
        let aViewController = TLAModuleViewController()
        return aViewController
    }
    
}
