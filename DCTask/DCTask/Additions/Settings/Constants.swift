//
//  Constants.swift
//  DCTask
//
//  Created by Hamest Tadevosyan on 14/10/2020.
//
import UIKit

struct Constants {
    
    struct AppFont {
        public static let regular = "Verdana"
        public static let bold = "Verdana-Bold"
        public static let boldItalic = "Verdana-BoldItalic"
        public static let italic = "Verdana-Italic"
    }
    
    struct FontSizes {
        static let title: CGFloat = 20
        static let contentTextTitle: CGFloat = 17
        static let contentTextDescription: CGFloat = 14
        static let contentTextSmall: CGFloat = 11
    }
    
    struct FontStyle {
        static let title = UIFont(name: Constants.AppFont.regular, size: Constants.FontSizes.title) ?? UIFont.systemFont(ofSize: Constants.FontSizes.title, weight: .regular)
        static let contentTextTitle = UIFont(name: Constants.AppFont.bold, size: Constants.FontSizes.contentTextTitle) ?? UIFont.systemFont(ofSize: Constants.FontSizes.contentTextTitle, weight: .semibold)
        static let contentTextDescription = UIFont(name: Constants.AppFont.italic, size: Constants.FontSizes.contentTextDescription) ?? UIFont.systemFont(ofSize: Constants.FontSizes.contentTextDescription, weight: .light)
        static let contentTextSmall = UIFont(name: Constants.AppFont.regular, size: Constants.FontSizes.contentTextSmall) ?? UIFont.systemFont(ofSize: Constants.FontSizes.contentTextSmall, weight: .light)
    }
    
    struct LabelStyle {
        static let title = Style(font: Constants.FontStyle.title, color:.titleColor)
        static let contentTextTitle = Style(font: Constants.FontStyle.contentTextTitle, color:.contentTextTitleColor)
        static let contentTextDescription = Style(font: Constants.FontStyle.contentTextDescription, color:.contentTextDescriptionColor)
        static let contentTextSmall = Style(font: Constants.FontStyle.contentTextSmall, color:.contentTextSmallColor)
    }
    
    struct Limits {
        public static let iconCornerRadius = CGFloat(5)
        public static let cellCornerRadius = CGFloat(15)
    }
    
    struct URLS {
        public static let cardAPIUrl = "https://api.raywenderlich.com/api/contents?filter%5Bcontent_types%5D%5B%5D=article&page%5Bnumber%5D=1&page%5Bsize%5D=20"
    }
}
