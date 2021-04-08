//
//  ViewExtensions.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 05/04/2021.
//

import Foundation
import UIKit

extension UIView{
    func dropShadow(color: UIColor, opacity: Float = 0.7, offset: CGSize, radius: CGFloat = 1 ,scale: Bool = true)  {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.cornerRadius = 10
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale:1
    
    }
}
