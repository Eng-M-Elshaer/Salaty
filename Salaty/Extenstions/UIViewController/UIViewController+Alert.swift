//
//  UIViewController+Alert.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import UIKit

extension UIViewController {
    /// add alert function to the VC
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
