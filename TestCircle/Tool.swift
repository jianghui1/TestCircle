//
//  Tool.swift
//  TestCircle
//
//  Created by ys on 15/12/28.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

var vc: UIViewController = UIViewController()
class Tool: NSObject {
    
    class func show(let viewcontroller: UIViewController) {
        
        vc = viewcontroller
        
        MBProgressHUD.showHUDAddedTo(viewcontroller.view, animated: true)
        
        // 添加定时器
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "timerAction", userInfo: nil, repeats: false)
            NSRunLoop.currentRunLoop().run()
        }
    }
    
    class func timerAction() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            MBProgressHUD.hideHUDForView(vc.view, animated: true)
        }
    }
    
}
