//
//  Style.swift
//  DCTask
//
//  Created by Hamest Tadevosyan on 14/10/2020.
//

import UIKit

class Style: NSObject {
    var font: UIFont?
    var color: UIColor?
    
    init(font: UIFont, color: UIColor) {
        self.font = font
        self.color = color
        super.init()
    }
    
    convenience init(color: UIColor) {
        self.init(font:Constants.FontStyle.contentTextDescription, color: color)
    }
    
    convenience init(font: UIFont) {
        self.init(font: font, color: .contentTextDescriptionColor)
    }
    
    convenience override init() {
        self.init(color: .contentTextDescriptionColor)
    }
}
