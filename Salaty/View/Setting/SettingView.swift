//
//  SettingView.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import UIKit

class SettingView: UIView {
    
    //MARK:- Outlets
    @IBOutlet weak var methodView: UIView!
    @IBOutlet weak var methodTextField: UITextField!
    @IBOutlet weak var schoolView: UIView!
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var soundSlientLabel: UILabel!
    @IBOutlet weak var soundSlientSwitch: UISwitch!
    @IBOutlet weak var stopSoundButton: UIButton!
    @IBOutlet weak var soundsView: UIView!
    @IBOutlet weak var soundTextField: UITextField!
    
    //MARK:- Public Methods
    func setup() {
        setupViews()
        setupTextFields()
        setupLabels()
        setupSwitches()
        setupLocationButton()
    }
    func setupSchool(_ school: String){
        schoolTextField.text = school
    }
    func setupMethod(_ method: String){
        methodTextField.text = method
    }
    func setupSound(_ soundName: String, isSlient: Bool){
        if isSlient {
            soundTextField.text = L10n.soundTitle
            soundSlientSwitch.isOn = true
        } else {
            soundTextField.text = soundName
            soundSlientSwitch.isOn = false
        }
    }
    func setSlient(){
        soundSlientSwitch.isOn = false
    }
}

//MARK:- Private Methods
extension SettingView {
    private func setupView(_ view: UIView){
        view.cornerStylish(color: .skyBlue)
        view.backgroundColor = .skyBlue
    }
    private func setupViews(){
        setupView(methodView)
        setupView(schoolView)
        setupView(soundsView)
    }
    private func setupTextField(_ textField: UITextField){
        textField.borderStyle = .none
        textField.textAlignment = .center
        textField.textColor = .white
        textField.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    private func setupTextFields(){
        methodTextField.tag = 10
        schoolTextField.tag = 20
        soundTextField.tag = 30
        setupTextField(methodTextField)
        setupTextField(schoolTextField)
        setupTextField(soundTextField)
        soundTextField.text = L10n.soundTitle
    }
    private func setupLabel(_ label: UILabel, text: String, isBold: Bool = false){
        label.textColor = .black
        label.text = text
        if isBold {
            UIFont.boldSystemFont(ofSize: 16.0)
        } else {
            UIFont.systemFont(ofSize: 16.0)
        }
    }
    private func setupLabels(){
        setupLabel(soundSlientLabel, text: L10n.soundSlient)
    }
    private func setupSwitch(_ theSwitch: UISwitch){
        theSwitch.onTintColor = .skyBlue
    }
    private func setupSwitches(){
        setupSwitch(soundSlientSwitch)
    }
    private func setupLocationButton(){
        stopSoundButton.cornerStylish(color: .skyBlue)
        stopSoundButton.setTitle(L10n.stop, for: .normal)
        stopSoundButton.setTitleColor(.white, for: .normal)
        stopSoundButton.backgroundColor = .skyBlue
    }
}
