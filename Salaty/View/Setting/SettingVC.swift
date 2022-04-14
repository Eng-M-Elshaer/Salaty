//
//  SettingVC.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import UIKit
import AVFoundation

protocol SettingVCProtocol: UIViewController {
    func setupSchool(_ school: String)
    func setupMethod(_ method: String)
}

class SettingVC: UIViewController {

    //MARK:- Outlets.
    @IBOutlet weak var settingView: SettingView!
    
    //MARK:- Propreties
    var viewModel: SettingViewModelProtocol!
    private var selectedTextField: UITextField!
    private var player = AVAudioPlayer()
    private var isPlaying = false
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView.setup()
        setBackgroundImage()
        setupPicker()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getDataFromUserDefults()
        navigationController?.setNavigationBarHidden(true, animated: true)
        viewModel.getMethod()
        viewModel.getSchool()
        settingView.setupSound(viewModel.getSound())
    }
    override func viewWillDisappear(_ animated: Bool) {
        viewModel.checkChanges()
    }
    
    // MARK:- Public Methods
    class func create() -> SettingVC {
        let settingVC: SettingVC = UIViewController.create(storyboardName: Storyboards.main, identifier: "\(SettingVC.self)")
        settingVC.viewModel = SettingViewModel(view: settingVC)
        return settingVC
    }
    
    //MARK:- Actions
    @IBAction func soundsBtnTapped(_ sender: UIButton) {
        settingView?.setupSound(sender.tag)
        playSound(songName: "\(sender.tag)")
    }
    @IBAction func elHaramSwitchChanged(_ sender: UISwitch) {
        settingView?.setupSound(sender.tag)
        playSound(songName: "\(sender.tag)")
    }
    @IBAction func slientSwitchChanged(_ sender: UISwitch) {
        settingView?.setupSound(sender.tag)
        playSound(songName: "\(sender.tag)")
    }
    @IBAction func stopSoundBtnTapped(_ sender: UIButton) {
        if isPlaying == true {
            player.stop()
            isPlaying = false
        }
    }
}

//MARK:- SettingVCProtocol
extension SettingVC: SettingVCProtocol {
    func setupSchool(_ school: String) {
        settingView?.setupSchool(school)
    }
    func setupMethod(_ method: String) {
        settingView?.setupMethod(method)
    }
}

// MARK:- TextField Delegate
extension SettingVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldTapped(textField: textField)
    }
}

// MARK:- UIPickerView DataSource
extension SettingVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfRows(for: selectedTextField)
    }
}

// MARK:- UIPickerView Delegate
extension SettingVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.title(for: selectedTextField, row: row)
    }
}

//MARK:- Privat Methods Picker
extension SettingVC {
    private func setupPicker() {
        let pickerView = UIPickerView()
        let toolbar = setupPickerToolbar()
        pickerView.dataSource = self
        pickerView.delegate = self
        for textField in [settingView.methodTextField, settingView.schoolTextField] {
            textField?.delegate = self
            textField?.inputView = pickerView
            textField?.inputAccessoryView = toolbar
        }
    }
    private func setupPickerToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelHandler))
        let flexButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: L10n.done, style: .plain, target: self, action: #selector(doneHandler))
        toolbar.setItems([cancelButton, flexButton, doneButton], animated: false)
        return toolbar
    }
    @objc private func doneHandler() {
        let picker = selectedTextField.inputView as! UIPickerView
        let selectedRow = picker.selectedRow(inComponent: 0)
        let selection = viewModel.title(for: selectedTextField, row: selectedRow)
        viewModel.setData(for: selectedTextField, row: selectedRow)
        selectedTextField.text = selection
        // Dismiss picker
        selectedTextField.resignFirstResponder()
        // Reset picker selection to the first row
        picker.selectRow(0, inComponent: 0, animated: false)
    }
    @objc private func cancelHandler() {
        selectedTextField.resignFirstResponder()
    }
}

//MARK:- Private Methods
extension SettingVC {
    private func textFieldTapped(textField: UITextField) {
        selectedTextField = textField
    }
    func playSound(songName: String){
        if isPlaying == false {
            goPlay(songName: songName)
            isPlaying = true
        } else {
            player.stop()
            goPlay(songName: songName)
            isPlaying = true
        }
    }
    func goPlay(songName: String){
        let theAudioPath = Bundle.main.path(forResource: songName, ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: theAudioPath!))
        } catch {
            print("Error With Playing the Sound")
        }
        isPlaying = true
        player.prepareToPlay()
        player.play()
    }
}
