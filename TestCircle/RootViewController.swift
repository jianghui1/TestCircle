//
//  RootViewController.swift
//  TestCircle
//
//  Created by ys on 15/12/28.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 显示加载框
//        ToolKit.showHUD(self)
        Tool.show(self)
        
        // 大圆
        let bigWidth: CGFloat = 200
        let bigView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: bigWidth, height: bigWidth))
        bigView.backgroundColor = UIColor.redColor()
        bigView.clipsToBounds = true
        bigView.layer.cornerRadius = bigWidth / 2
        self.view.addSubview(bigView)
        
        // 小圆
        let minWidth: CGFloat = 20
        let minView: UIView = UIView(frame: CGRect(x: 90, y: 190, width: minWidth, height: minWidth))
        minView.backgroundColor = UIColor.yellowColor()
        minView.clipsToBounds = true
        minView.layer.cornerRadius = minWidth / 2
        self.view.addSubview(minView)
        
        // 平移手势
        let pan: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "panAction:")
        minView.addGestureRecognizer(pan)
    }
    
    func panAction(let sender: UIPanGestureRecognizer) {
        let point = sender.translationInView(sender.view)
        var x: CGFloat = point.x + (sender.view?.center.x)!
        let y: CGFloat = point.y + (sender.view?.center.y)!
        sender.setTranslation(CGPoint.zero, inView: sender.view)
        
        if x > 300 {
            x = 300
        }
        if x < 100 {
            x = 100
        }
        
        var center: CGPoint = (sender.view?.center)!
        center.x = x
        if y < 200 {
            center.y = 200 - sqrt(100 * 100 - (200 - center.x) * (200 - center.x))
        } else {
            center.y = 200 + sqrt(100 * 100 - (200 - center.x) * (200 - center.x))
        }
        sender.view?.center = center
    }
}
