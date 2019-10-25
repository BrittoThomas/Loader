//
//  UIViewController.swift
//  Loader
//
//  Created by Britto Thomas on 22/10/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import UIKit


extension UIViewController{
    
    static var loader : Loader?
    static var blurEffectView : UIVisualEffectView?
    
    func showLoader() {
        self.hideLoader()

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.8
        blurEffectView.frame = view.bounds
        blurEffectView.frame.origin.y = -22
        blurEffectView.frame.size.height += 22
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        let loader = Loader.init(frame: CGRect.init(x: 0,
                                                    y: 0,
                                                    width: 50, height: 25))
        loader.center = self.view.center
        self.view.addSubview(loader)
        self.view.isUserInteractionEnabled = false
        
        UIViewController.loader = loader
        UIViewController.blurEffectView = blurEffectView
    }
    
    func hideLoader() {
        if let loader = UIViewController.loader {
            loader.removeFromSuperview()
            UIViewController.loader = nil
        }
        
        if let blurEffectView = UIViewController.blurEffectView {
            blurEffectView.removeFromSuperview()
            UIViewController.blurEffectView = nil
        }
        
        self.view.isUserInteractionEnabled = true
    }
    
}
