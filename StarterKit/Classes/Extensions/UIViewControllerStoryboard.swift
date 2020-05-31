//
//  UIViewControllerStoryboard.swift
//  Getus
//
//  Created by Matthieu Lagast on 03/11/2019.
//  Copyright © 2019 Getus. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    case account = "Account"
    case authentication = "Authentication"
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        //swiftlint:disable:next force_cast
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
        
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

