//
//  SettingViewModel.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import UIKit

protocol SettingViewModelProtocol{
    func numberOfRows(for textField: UITextField) -> Int
    func title(for textField: UITextField, row: Int) -> String?
    func checkChanges()
    func getMethod()
    func getSchool()
    func setData(for textField: UITextField, row: Int)
    func getDataFromUserDefults()
    func getSound() -> Int
}

class SettingViewModel {
    
    // MARK:- Private Properties
    private weak var view: SettingVCProtocol?
    private var method: Int = 0
    private var school: Int = 0
    private let methods = [(Name: L10n.karachi, ID: 1),
                          (Name: L10n.isna, ID: 2),
                          (Name: L10n.worldLeague, ID: 3),
                          (Name: L10n.makkah, ID: 4),
                          (Name: L10n.egyptian, ID: 5),
                          (Name: L10n.gulf, ID: 8),
                          (Name: L10n.kuwait, ID: 9),
                          (Name: L10n.qatar, ID: 10),
                          (Name: L10n.singapore, ID: 11),
                          (Name: L10n.france, ID: 12),
                          (Name: L10n.turkey, ID: 13)]
    private let schools: [String] = [L10n.shafii, L10n.hanfi]
   
    // MARK:- Init
    init(view: SettingVCProtocol) {
        self.view = view
    }
}

//MARK:- MainViewModelProtocol
extension SettingViewModel: SettingViewModelProtocol {
    func getDataFromUserDefults(){
        self.method = UserDefultsManger.shared().method
        self.school = UserDefultsManger.shared().school
    }
    func setData(for textField: UITextField, row: Int) {
        if textField.tag == 10 {
            UserDefultsManger.shared().method = self.methods[row].ID
        } else {
            UserDefultsManger.shared().school = row
        }
    }
    func numberOfRows(for textField: UITextField) -> Int {
        if textField.tag == 10 {
            return methods.count
        } else {
            return schools.count
        }
    }
    func title(for textField: UITextField, row: Int) -> String? {
        if textField.tag == 10 {
            return methods[row].Name
        } else {
            return schools[row]
        }
    }
    func checkChanges(){
        if method != UserDefultsManger.shared().method || school != UserDefultsManger.shared().school {
            UserDefultsManger.shared().didChange = true
        }
    }
    func getMethod(){
        for method in methods {
            if self.method == method.ID {
                self.view?.setupMethod(method.Name)
                return
            } else {
                self.view?.setupMethod(methods[3].Name)
            }
        }
    }
    func getSchool(){
        for (key, value) in schools.enumerated() {
            if self.school == key {
                self.view?.setupSchool(value)
                return
            } else {
                self.view?.setupSchool(schools[0])
            }
        }
    }
    func getSound() -> Int{
        return UserDefultsManger.shared().sound
    }
}
