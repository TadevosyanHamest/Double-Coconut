//
//  UIExtensions.swift
//  DCTask
//
//  Created by Hamest Tadevosyan on 15/10/2020.
//

import UIKit

let spinner = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
let loadingView = spinner.view


extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

extension UIView {
    
    func showLoader() {
        let currentWindow: UIWindow? = UIWindow.key
        currentWindow?.addSubview(loadingView!)
    }
    
    func removeLoader() {
        loadingView!.removeFromSuperview()
    }
}

extension UILabel {
    func setStyle(with style: Style) {
        self.font = style.font
        self.textColor = style.color
    }
}

extension UIColor {
    class var titleColor: UIColor {
        return  .gray
    }
    class var contentTextTitleColor: UIColor {
        return  .darkGray
    }
    class var contentTextDescriptionColor: UIColor {
        return  darkText
    }
    class var contentTextSmallColor: UIColor {
        return  lightGray
    }
    
    class var backgroundColor: UIColor {
        return  .lightGray
    }
    class var selectedCellColor: UIColor {
        return  UIColor.lightGray
    }
    
    class var CellGray: UIColor {
        return  UIColor.lightGray
    }
}
