//
//  MainViewModel.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import MapKit
import RealmSwift

protocol MainViewModelProtocol{
    func getAPIData(lat: Double, log: Double)
    func getSala()
    func checkChanges()
}

class MainViewModel {
    
    // MARK:- Private Properties
    private weak var view: MainVCProtocol?
    private var thisDayDate = ""
    private var thisYear = 2022
    private var thisMonth = 1
    private var thisDay = 0
    private var newDay = ""
    private var theDay = ""
    private var theMethod = UserDefultsManger.shared().method
    private var theSchool = UserDefultsManger.shared().school
    private let realm = try! Realm()
    private let lang = Locale.current.languageCode
    private var lat: Double = UserDefultsManger.shared().lat
    private var log: Double = UserDefultsManger.shared().log
   
    // MARK:- Init
    init(view: MainVCProtocol) {
        self.view = view
        getDate(dayDate: "")
    }
}

//MARK:- MainViewModelProtocol
extension MainViewModel: MainViewModelProtocol {
    func getAPIData(lat: Double, log: Double) {
        self.lat = lat
        self.log = log
        let params = SalatyParameters(method: self.theMethod, school: self.theSchool, year: self.thisYear, month: self.thisMonth, lat: lat, log: log)
        self.view?.showLoader()
        APIManager.getDataFromAPI(params) { (error, result) in
            if let error = error {
                self.view?.showAlert(message: error.localizedDescription)
            } else if let data = result {
                for theData in data {
                    let fajr = self.removeEET(theData.timings.fajr)
                    let dhuhr = self.removeEET(theData.timings.dhuhr)
                    let asr = self.removeEET(theData.timings.asr)
                    let maghrib = self.removeEET(theData.timings.maghrib)
                    let isha = self.removeEET(theData.timings.isha)
                    if theData.date.readable == self.thisDayDate {
                        let salawat = Salawat(fajr, dhuhr, asr, maghrib, isha)
                        self.view?.setupSala(sala: salawat)
                    }
                    let sala = RealmManger.shared().getSala(fajr,
                                                            dhuhr,
                                                            asr,
                                                            maghrib,
                                                            isha,
                                                            theData.date.readable,
                                                            self.adjectPrefix(from: fajr).hour,
                                                            self.adjectPrefix(from: fajr).min,
                                                            self.adjectPrefix(from: dhuhr).hour,
                                                            self.adjectPrefix(from: dhuhr).min,
                                                            self.adjectPrefix(from: asr).hour,
                                                            self.adjectPrefix(from: asr).min,
                                                            self.adjectPrefix(from: maghrib).hour,
                                                            self.adjectPrefix(from: maghrib).min,
                                                            self.adjectPrefix(from: isha).hour,
                                                            self.adjectPrefix(from: isha).min)
                    RealmManger.shared().addSalaToRealm(new: sala)
                }
            }
            self.setNotification()
            UserDefultsManger.shared().didChange = false
            self.view?.hideLoader()
        }
    }
    func getSala(){
        checkSala(theDate: thisDayDate)
    }
    func checkChanges(){
        if UserDefultsManger.shared().didChange {
            getAPIData(lat: self.lat, log: self.log)
        }
    }
}

//MARK:- Private Methods
extension MainViewModel {
    private func setNotification(){
        var num = 1
        if realm.objects(Sala.self).first != nil {
            for item in realm.objects(Sala.self){
                if thisDayDate == item.theDate {
                    print("\(thisYear)-\(thisMonth)-\(theDay)-----\(item.fajrH)-\(item.fajrM)")
                    NotificationManger.shared().createNotification(theDay: theDay,
                                fajrH: item.fajrH, fajrM: item.fajrM,
                                dhuhrH: item.dhuhrH, dhuhrM: item.dhuhrM,
                                asrH: item.asrH, asrM: item.asrM,
                                maghribH: item.maghribH, maghribM: item.maghribM,
                                ishaH: item.ishaH, ishaM: item.ishaM, year: thisYear, theMonth: thisMonth)
                    num = num + 1
                    getDate(dayDate: thisDayDate)
                } else if item.theDate == newDay && num <= 11{
                    print("\(thisYear)-\(thisMonth)-\(theDay)-----\(item.fajrH)-\(item.fajrM)")
                    NotificationManger.shared().createNotification(theDay: theDay,
                                fajrH: item.fajrH, fajrM: item.fajrM,
                                dhuhrH: item.dhuhrH, dhuhrM: item.dhuhrM,
                                asrH: item.asrH, asrM: item.asrM,
                                maghribH: item.maghribH, maghribM: item.maghribM,
                                ishaH: item.ishaH, ishaM: item.ishaM, year: thisYear, theMonth: thisMonth)
                    getDate(dayDate: newDay)
                    num = num + 1
                }
            }
        }
    }
    private func checkSala(theDate: String){
        if realm.objects(Sala.self).first != nil {
            for item in realm.objects(Sala.self){
                if item.theDate == theDate {
                    let salawat = Salawat(item.fajr, item.dhuhr, item.asr, item.maghrib, item.isha)
                    self.view?.setupSala(sala: salawat)
                }
            }
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            setNotification()
        } else {
            getData()
        }
    }
    private func getData(){
        APIData()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        setNotification()
    }
    private func APIData(){
        RealmManger.shared().remove(name: Sala.self)
        getAPIData(lat: self.lat, log: self.log)
    }
    private func adjectPrefix(from: String) -> (hour: String, min: String){
        let index2 = from.index(from.startIndex, offsetBy: 2)
        let index3 = from.index(from.startIndex, offsetBy: 3)
        let hour = String(from.prefix(upTo: index2))
        let min = String(from.suffix(from: index3))
        return (hour, min)
    }
    private func removeEET(_ theSentence: String) -> String{
        var sentence = theSentence
        let wordToRemove = " (EET)"
        let wordToRemove2 = " (AST)"
        let wordToRemove3 = " (EDT)"
        let wordToRemove4 = " (CST)"
        let wordToRemove5 = " (CDT)"
        let wordToRemove6 = " (MST)"
        let wordToRemove7 = " (MDT)"
        let wordToRemove8 = " (PST)"
        let wordToRemove9 = " (PDT)"
        let wordToRemove10 = " (AKST)"
        let wordToRemove11 = " (AKDT)"
        let wordToRemove12 = " (HST)"
        let wordToRemove13 = " (HAST)"
        let wordToRemove14 = " (HADT)"
        let wordToRemove15 = " (SST)"
        let wordToRemove16 = " (SDT)"
        let wordToRemove17 = " (CHST)"
        
        if let range = sentence.range(of: wordToRemove) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove2) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove3) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove4) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove5) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove6) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove7) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove8) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove9) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove10) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove11) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove12) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove13) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove14) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove15) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove16) {
            sentence.removeSubrange(range)
        }
        if let range = sentence.range(of: wordToRemove17) {
            sentence.removeSubrange(range)
        }
        return sentence
    }
    private func getDate(dayDate: String){
        let theDate = Date()
        let calendar = Calendar.current
        let component = calendar.dateComponents([.year, .month, .day], from: theDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "en_US")
        thisDayDate = formatter.string(from: theDate)
        self.thisYear = component.year ?? 2022
        self.thisMonth = component.month ?? 1
        self.thisDay = component.day ?? 1
        if dayDate != "" {
            let myDate = formatter.date(from: dayDate)
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: myDate!)
            let dateToString = formatter.string(from: tomorrow!)
            newDay = dateToString
            let index2 = dateToString.index(dateToString.startIndex, offsetBy: 2)
            self.theDay = String(dateToString.prefix(upTo: index2))
        }
    }
}
