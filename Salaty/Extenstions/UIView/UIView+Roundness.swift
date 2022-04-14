//
//  UIView+Roundness.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import UIKit

extension UIView {
    func cornerStylish(color: UIColor, borderWidth: CGFloat = 2, cornerRadius: CGFloat = 20) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
    func addShadow(opacity: Float = 0.2, color: UIColor = UIColor(displayP3Red: 27/255, green: 20/255, blue: 15/255, alpha: 1), shadowRadius: CGFloat = 4) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = shadowRadius
    }
}
