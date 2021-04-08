//
//  Constants.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 05/04/2021.
//

import Foundation
import UIKit


struct APPURL {
    
    static let List     = "https://private-anon-613fe9c1c6-tpbookserver.apiary-mock.com/books"
    static let Detail     = "https://private-anon-f0acd5c0b8-tpbookserver.apiary-mock.com/book"
    
}

struct FontNames {
    
    struct KohinoorDevanagari {
        static let KohinoorLight = "KohinoorDevanagari-Light"
        static let KohinoorMedium = "KohinoorDevanagari-Medium"
        static let KohinoorSemiBold = "KohinoorDevanagari-SemiBold"
        static let KohinoorBook = "KohinoorDevanagari-Book"
    }
}

struct AppColors {
    
    struct TextColors {
        static let DarkestGray = UIColor(rgb: 0x212121)
        static let DarkGray = UIColor(rgb: 0x313131)
        static let Black = UIColor(rgb: 0x000000)
        static let LightGray = UIColor(rgb: 0xECECEC)
        static let green = UIColor(rgb: 0x008000)
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
      
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
