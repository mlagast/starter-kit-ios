import UIKit

protocol Localizable {
    
    var localizationKey: String? { get set }
    func updateLocalization(_ localizedString: String?)
}

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func localized(tableName: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
    }
}

// MARK: - Localizable
extension UIView: Localizable {
    
    fileprivate struct AssociatedKeys {
        static var KLocalizationKey = "localizationKey"
    }
    
    @IBInspectable
    var localizationKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.KLocalizationKey) as? String
        } set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.KLocalizationKey, newValue as String?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                let localizedString = localizationKey?.localized
                updateLocalization(localizedString)
            }
        }
    }
    
    func updateLocalization(_ localizedString: String?) {
        guard let string = localizedString else {
            return
        }
        switch self {
        case let label as UILabel:
            label.text = string
        case let button as UIButton:
            button.setTitle(string, for: UIControl.State())
        case let textField as UITextField:
            textField.placeholder = string
        case let textView as UITextView:
            textView.text = string
        default:
            print("Unsupported localizable object: \(self)")
        }
    }
}

extension UIBarItem: Localizable {
    
    fileprivate struct AssociatedKeys {
        static var KLocalizationKey = "localizationKey"
    }
    
    @IBInspectable
    var localizationKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.KLocalizationKey) as? String
        } set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.KLocalizationKey, newValue as String?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                let localizedString = localizationKey?.localized
                updateLocalization(localizedString)
            }
        }
    }
    
    func updateLocalization(_ localizedString: String?) {
        guard let string = localizedString else {
            return
        }
        
        switch self {
        case let item:
            item.title = string
        }
    }
}

extension UIViewController: Localizable {
    
    fileprivate struct AssociatedKeys {
        static var KLocalizationKey = "localizationKey"
    }
    
    @IBInspectable
    var localizationKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.KLocalizationKey) as? String
        } set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.KLocalizationKey, newValue as String?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                let localizedString = localizationKey?.localized
                updateLocalization(localizedString)
            }
        }
    }
    
    func updateLocalization(_ localizedString: String?) {
        guard let string = localizedString else {
            return
        }
        
        switch self {
        case let item:
            item.title = string
        }
    }
}
