//
//  RealmModel.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import RealmSwift


class TheMethod: Object {
    
    static let instance = TheMethod()
    
    @objc dynamic var name = ""
    @objc dynamic var id = 0
    
}

class MySetting: Object {
    
    static let instance = MySetting()
    
    @objc dynamic var name = ""
    @objc dynamic var id = 0
    
}

class Sound: Object {
    
    static let instance = Sound()
    
    @objc dynamic var id = 0
    @objc dynamic var status = true
    
}

class School: Object {
    
    static let instance = School()
    
    @objc dynamic var name = ""
    @objc dynamic var id = 0
    
}

class Sala: Object {
    
    static let instance = Sala()
    
    @objc dynamic var fajr = ""
    @objc dynamic var dhuhr = ""
    @objc dynamic var asr = ""
    @objc dynamic var maghrib = ""
    @objc dynamic var isha = ""
    @objc dynamic var fajrH = ""
    @objc dynamic var dhuhrH = ""
    @objc dynamic var asrH = ""
    @objc dynamic var maghribH = ""
    @objc dynamic var ishaH = ""
    @objc dynamic var fajrM = ""
    @objc dynamic var dhuhrM = ""
    @objc dynamic var asrM = ""
    @objc dynamic var maghribM = ""
    @objc dynamic var ishaM = ""
    @objc dynamic var theDate = ""
    
}

class City: Object {
    
    static let instance = City()
    
    @objc dynamic var name = ""
    @objc dynamic var lat = 0.00000000
    @objc dynamic var long = 0.0000000
    
}

class Note: Object {
    
    static let instance = Note()
    
    @objc dynamic var N = 0
    
}

class Note2: Object {
    
    static let instance = Note()
    
    @objc dynamic var N = 0
    
}
