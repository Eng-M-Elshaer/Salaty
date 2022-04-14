//
//  UIViewController+setBackground.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import UIKit

extension UIViewController {
    func setBackgroundImage(){
        let backgroundImageView = UIImageView(frame: self.view.frame)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = Asset.background.image
        self.view.insertSubview(backgroundImageView, at: 0)
    }
}
