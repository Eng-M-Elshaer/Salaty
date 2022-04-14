//
//  RealmManger.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import RealmSwift

typealias Salawat = (fajr: String, dohear: String, asr: String, magirib: String, isha: String)

class RealmManger {
    
    // MARK:- Singleton
    private static let sharedInstance = RealmManger()
    
    class func shared() -> RealmManger {
        return RealmManger.sharedInstance
    }
    
    //MARK:- Propreties
    let realm = try! Realm()
    let lang = Locale.current.languageCode
    typealias Salawat = (fajr: String, dohear: String, asr: String, magirib: String, isha: String)
    
    //MARK:- Public Methods
    func addSalaToRealm(new: Sala){
        do {
            let _: () = try realm.write {realm.add(new)}
        } catch let error {
            print(error)
        }
    }
    func getSala(_ fajr: String, _ dhuhr: String,_ asr: String, _ maghrib: String, _ isha: String, _ theDate: String, _ fH: String, _ fM: String, _ dH: String, _ dM: String, _ aH: String, _ aM: String, _ mH: String, _ mM: String, _ iH: String, _ iM: String) -> Sala{
        let mySala = Sala()
        mySala.fajr = fajr
        mySala.fajrH = fH
        mySala.fajrM = fM
        mySala.dhuhr = dhuhr
        mySala.dhuhrH = dH
        mySala.dhuhrM = dM
        mySala.asr = asr
        mySala.asrH = aH
        mySala.asrM = aM
        mySala.maghrib = maghrib
        mySala.maghribH = mH
        mySala.maghribM = mM
        mySala.isha = isha
        mySala.ishaH = iH
        mySala.ishaM = iM
        mySala.theDate = theDate
        return mySala
    }
    func remove(name: Object.Type){
        if realm.objects(name.self).first != nil {
            let myData = realm.objects(Sala.self)
            try! realm.write {
                realm.delete(myData)
            }
        }
    }
}
