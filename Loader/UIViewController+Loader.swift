//
//  UIViewController.swift
//  Loader
//
//  Created by Britto Thomas on 22/10/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import UIKit


extension UIViewController{
    
    func showLoader() {
        let loader = Loader.shared
        loader.center = self.view.center
        self.view.addSubview(loader)
        self.view.isUserInteractionEnabled = false
    }
    
    func hideLoader() {
        let loader = Loader.shared
        loader.removeFromSuperview()
        self.view.isUserInteractionEnabled = true
    }
    
}


