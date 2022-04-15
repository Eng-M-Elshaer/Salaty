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
    @IBOutlet weak var prayerLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var elFajrTimeLabel: UILabel!
    @IBOutlet weak var elDouharTimeLabel: UILabel!
    @IBOutlet weak var elAsrTimeLabel: UILabel!
    @IBOutlet weak var elMajeraibTimeLabel: UILabel!
    @IBOutlet weak var elIshaTimeLabel: UILabel!
    
    
    //MARK:- Public Methods
    func setup(){
        setupViews()
        setupLabels()
        setupLocationButton()
        locatinLabel.text = UserDefultsManger.shared().city
        setupTitle()
        setupSalaData()
    }
    func setupLocationLabel(address: String){
        locatinLabel.text = address
    }
    func setupSalaData(_ data: Salawat){
        elFajrTimeLabel.text = data.fajr
        elDouharTimeLabel.text = data.dohear
        elAsrTimeLabel.text = data.asr
        elMajeraibTimeLabel.text = data.magirib
        elIshaTimeLabel.text = data.isha
    }
}

//MARK:-  Private Methods
extension MainView {
    private func setupSalaData(){
        elFajrLabel.text = L10n.fajr
        elDouharLabel.text = L10n.dhour
        elAsrLabel.text = L10n.asr
        elMajeraibLabel.text = L10n.majirb
        elIshaLabel.text = L10n.isha
    }
    private func setupView(_ view: UIView){
        view.backgroundColor = .clear
    }
    private func setupViews(){
        setupView(elFajrView)
        setupView(elDouharView)
        setupView(elAsrView)
        setupView(elMajeraibView)
        setupView(elIshaView)
        setupView(titleView)
    }
    private func setupLabel(_ label: UILabel){
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.text = "....."
    }
    private func setupLabels(){
        setupLabel(locatinLabel)
        setupLabel(elFajrLabel)
        setupLabel(elDouharLabel)
        setupLabel(elAsrLabel)
        setupLabel(elMajeraibLabel)
        setupLabel(elIshaLabel)
        setupLabel(elFajrTimeLabel)
        setupLabel(elDouharTimeLabel)
        setupLabel(elAsrTimeLabel)
        setupLabel(elMajeraibTimeLabel)
        setupLabel(elIshaTimeLabel)
    }
    private func setupTitle(){
        prayerLabel.text = L10n.prayer
        timeLabel.text = L10n.time
        prayerLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        timeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        prayerLabel.textColor = .darkGrey
        timeLabel.textColor = .darkGrey
    }
    private func setupLocationButton(){
        changeLocationButton.cornerStylish(color: .skyBlue)
        changeLocationButton.setTitle("   " + L10n.changeLocation, for: .normal)
        changeLocationButton.setTitleColor(.white, for: .normal)
        changeLocationButton.backgroundColor = .skyBlue
    }
}
