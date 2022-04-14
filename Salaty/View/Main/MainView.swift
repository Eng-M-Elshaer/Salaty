//
//  MainView.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import UIKit

class MainView: UIView {

    //MARK:- Outlets
    @IBOutlet weak var locatinLabel: UILabel!
    @IBOutlet weak var elFajrView: UIView!
    @IBOutlet weak var elFajrLabel: UILabel!
    @IBOutlet weak var elDouharView: UIView!
    @IBOutlet weak var elDouharLabel: UILabel!
    @IBOutlet weak var elMajeraibView: UIView!
    @IBOutlet weak var elMajeraibLabel: UILabel!
    @IBOutlet weak var elAsrView: UIView!
    @IBOutlet weak var elAsrLabel: UILabel!
    @IBOutlet weak var elIshaView: UIView!
    @IBOutlet weak var elIshaLabel: UILabel!
    @IBOutlet weak var changeLocationButton: UIButton!
    
    //MARK:- Public Methods
    func setup(){
        setupViews()
        setupLabels()
        setupLocationButton()
        locatinLabel.text = UserDefultsManger.shared().city
    }
    func setupLocationLabel(address: String){
        locatinLabel.text = address
    }
    func setupSalaData(_ data: Salawat){
        elFajrLabel.text = L10n.fajr + " " + data.fajr
        elDouharLabel.text = L10n.dhour + " " + data.dohear
        elAsrLabel.text = L10n.asr + " " + data.asr
        elMajeraibLabel.text = L10n.majirb + " " + data.magirib
        elIshaLabel.text = L10n.isha + " " + data.isha
    }
}

//MARK:-  Private Methods
extension MainView {
    private func setupView(_ view: UIView){
        view.cornerStylish(color: .lightBlue)
        view.backgroundColor = .lightBlue
    }
    private func setupViews(){
        setupView(elFajrView)
        setupView(elDouharView)
        setupView(elAsrView)
        setupView(elMajeraibView)
        setupView(elIshaView)
    }
    private func setupLabel(_ label: UILabel, color: UIColor = .specialPurple){
        label.textColor = color
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "....."
    }
    private func setupLabels(){
        setupLabel(locatinLabel, color: .black)
        setupLabel(elFajrLabel)
        setupLabel(elDouharLabel)
        setupLabel(elAsrLabel)
        setupLabel(elMajeraibLabel)
        setupLabel(elIshaLabel)
    }
    private func setupLocationButton(){
        changeLocationButton.cornerStylish(color: .specialPurple)
        changeLocationButton.setTitle(L10n.changeLocation, for: .normal)
        changeLocationButton.setTitleColor(.lightBlue, for: .normal)
        changeLocationButton.backgroundColor = .specialPurple
    }
}
