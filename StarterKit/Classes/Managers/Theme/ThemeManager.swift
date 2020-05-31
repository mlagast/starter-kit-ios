//
//  ThemeManager.swift
//  StarterKit
//
//  Created by Matthieu Lagast on 31/05/2020.
//  Copyright © 2020 mlagast. All rights reserved.
//

import UIKit

extension UIColor {
    class var appBlue: UIColor {
        return #colorLiteral(red: 0.08235294118, green: 0.5333333333, blue: 0.6980392157, alpha: 1)
    }
}

class ThemeManager {
    class func applyDefaultTheme() {
        ThemeManager.applyToNavigation(appearance: UINavigationBar.appearance())
        ThemeManager.applyToNavigationButton(appearance: UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self]))
        ThemeManager.applyToBarButton(appearance: UIBarButtonItem.appearance())
    }
    
    class func applyToNavigation(appearance: UINavigationBar) {
        appearance.isTranslucent = false
        appearance.tintColor = UIColor.appBlue
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.appBlue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        ]
    }
    
    class func applyToNavigationButton(appearance: UIButton) {
        appearance.tintColor = UIColor.appBlue
        appearance.setTitleColor(UIColor.appBlue, for: .normal)
    }
    
    class func applyToBarButton(appearance: UIBarButtonItem) {
        appearance.tintColor = UIColor.appBlue
    }
}

