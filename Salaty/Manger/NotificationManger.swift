//
//  NotificationManger.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import UserNotifications
import RealmSwift

class NotificationManger {
    
    // MARK:- Singleton
    private static let sharedInstance = NotificationManger()
    
    class func shared() -> NotificationManger {
        return NotificationManger.sharedInstance
    }
    
    //MARK:- Propreties
    let lang = Locale.current.languageCode
    let realm = try! Realm()
    
    //MARK:- Public Methods
    func createNotification(theDay: String,
                     fajrH: String, fajrM: String,
                     dhuhrH: String, dhuhrM: String,
                     asrH: String, asrM: String,
                     maghribH: String, maghribM: String,
                     ishaH: String, ishaM: String, year: Int, theMonth: Int){
        scheduleNotification(yyy: year, mmm: theMonth, ddd: theDay, hhh: fajrH, mm: fajrM, sala: L10n.fajr)
        scheduleNotification(yyy: year, mmm: theMonth, ddd: theDay, hhh: dhuhrH, mm: dhuhrM, sala: L10n.dhour)
        scheduleNotification(yyy: year, mmm: theMonth, ddd: theDay, hhh: asrH, mm: asrM, sala: L10n.asr)
        scheduleNotification(yyy: year, mmm: theMonth, ddd: theDay, hhh: maghribH, mm: maghribM, sala: L10n.majirb)
        scheduleNotification(yyy: year, mmm: theMonth, ddd: theDay, hhh: ishaH, mm: ishaM, sala: L10n.isha)
    }
    func scheduleNotification(yyy: Int, mmm: Int, ddd: String, hhh: String, mm: String, sala: String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = L10n.salaTime
        content.body = "\(L10n.timeFor) \(sala)"
        let athanTrack = "\(UserDefultsManger.shared().sound)"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "\(athanTrack).mp3"))
        var dateComponents = DateComponents()
        dateComponents.hour = Int(hhh)
        dateComponents.minute = Int(mm)
        dateComponents.day = Int(ddd)
        dateComponents.month = mmm
        dateComponents.year = yyy
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
}
