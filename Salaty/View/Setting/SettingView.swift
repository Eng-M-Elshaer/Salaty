//
//  SettingView.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import UIKit

class SettingView: UIView {
    
    //MARK:- Outlets
    @IBOutlet weak var systemView: UIView!
    @IBOutlet weak var methodTextField: UITextField!
    @IBOutlet weak var mazhabView: UIView!
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var soundsTitleLabel: UILabel!
    @IBOutlet weak var soundOneLabel: UILabel!
    @IBOutlet weak var soundTwoLabel: UILabel!
    @IBOutlet weak var soundThreeLabel: UILabel!
    @IBOutlet weak var soundElHaramLabel: UILabel!
    @IBOutlet weak var soundSlientLabel: UILabel!
    @IBOutlet weak var soundOneButton: UIButton!
    @IBOutlet weak var soundTwoButton: UIButton!
    @IBOutlet weak var soundThreeButton: UIButton!
    @IBOutlet weak var soundElHaramSwitch: UISwitch!
    @IBOutlet weak var soundSlientSwitch: UISwitch!
    @IBOutlet weak var stopSoundButton: UIButton!
    
    //MARK:- Public Methods
    func setup() {
        setupViews()
        setupTags()
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
    func setupSound(_ tag: Int){
        clearSoundButtons()
        switch tag {
        case 1:
            soundOneButton.tintColor = .lightBlue
            break
        case 2:
            soundTwoButton.tintColor = .lightBlue
            break
        case 3:
            soundThreeButton.tintColor = .lightBlue
            break
        case 4:
            soundElHaramSwitch.isOn = true
            break
        case 5:
            soundSlientSwitch.isOn = true
            break
        default:
            break
        }
        UserDefultsManger.shared().sound = tag
    }
}

//MARK:- Private Methods
extension SettingView {
    private func clearSoundButtons(){
        soundOneButton.tintColor = .white
        soundTwoButton.tintColor = .white
        soundThreeButton.tintColor = .white
        soundElHaramSwitch.isOn = false
        soundSlientSwitch.isOn = false
    }
    private func setupView(_ view: UIView){
        view.cornerStylish(color: .lightBlue)
        view.backgroundColor = .lightBlue
    }
    private func setupViews(){
        setupView(systemView)
        setupView(mazhabView)
    }
    private func setupTextField(_ textField: UITextField){
        textField.borderStyle = .none
        textField.textAlignment = .center
        textField.textColor = .specialPurple
        textField.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    private func setupTextFields(){
        methodTextField.tag = 10
        schoolTextField.tag = 20
        setupTextField(methodTextField)
        setupTextField(schoolTextField)
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
        setupLabel(soundsTitleLabel, text: L10n.soundTitle, isBold: true)
        setupLabel(soundOneLabel, text: L10n.soundOne)
        setupLabel(soundTwoLabel, text: L10n.soundTwo)
        setupLabel(soundThreeLabel, text: L10n.soundThree)
        setupLabel(soundElHaramLabel, text: L10n.soundElHaram)
        setupLabel(soundSlientLabel, text: L10n.soundSlient)
    }
    private func setupSwitch(_ theSwitch: UISwitch){
        theSwitch.onTintColor = .specialPurple
    }
    private func setupSwitches(){
        setupSwitch(soundElHaramSwitch)
        setupSwitch(soundSlientSwitch)
    }
    private func setupLocationButton(){
        stopSoundButton.cornerStylish(color: .specialPurple)
        stopSoundButton.setTitle(L10n.stop, for: .normal)
        stopSoundButton.setTitleColor(.lightBlue, for: .normal)
        stopSoundButton.backgroundColor = .specialPurple
    }
    private func setupTags(){
        soundOneButton.tag = 1
        soundTwoButton.tag = 2
        soundThreeButton.tag = 3
        soundElHaramSwitch.tag = 4
        soundSlientSwitch.tag = 5
    }
}
