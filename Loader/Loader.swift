//
//  Loader.swift
//  Loader
//
//  Created by Britto Thomas on 22/10/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import UIKit

class Loader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.clipsToBounds = true
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appMovedToBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appMovedToForground),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
        
        self.setup()
    }
    
    @objc func appMovedToBackground() {
        print("App moved to Background!")
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    @objc func appMovedToForground() {
        print("App moved to Forground!")
        self.setup()
    }
    
    
    func setup() {
        var frame1 = CGRect.init(origin: .zero, size: frame.size)
        frame1.size.width = self.bounds.height
        
        var frame2 = CGRect.init(origin: .zero, size: frame.size)
        frame2.size.width = self.bounds.height
        frame2.origin.x = 25
        
        self.addCircle(index:0, frame: frame1)
        self.addCircle(index:1, frame: frame2)
    }
    
    func addCircle(index:Int, frame:CGRect) {
        
        let circle: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: frame.width/2, y: frame.width/2), radius: frame.width/2, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        circle.path = path.cgPath
        circle.frame = frame
        self.layer.addSublayer(circle)
        
        let animation1 = CAKeyframeAnimation(keyPath: "transform.scale")
        let animation2 = CAKeyframeAnimation(keyPath: "fillColor")
        
        if index % 2 == 0 {
            animation1.values = [0.5, 1]
            animation2.values = [UIColor.theme.maroon.cgColor, UIColor.theme.blue.cgColor]
        }else{
            animation1.values = [1, 0.5]
            animation2.values = [UIColor.theme.blue.cgColor, UIColor.theme.maroon.cgColor]
        }
        
        animation1.keyTimes = [0, 1]
        animation2.keyTimes = [0, 1]
        
        animation1.duration = 0.3
        animation2.duration = 0.3
        
        animation1.autoreverses = true
        animation2.autoreverses = true
        
        animation1.repeatCount = HUGE
        animation2.repeatCount = HUGE
        
        circle.add(animation1, forKey: "animation1")
        circle.add(animation2, forKey: "animation2")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
