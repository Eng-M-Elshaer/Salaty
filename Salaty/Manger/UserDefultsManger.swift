//
//  UserDefultsManger.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 5/25/20.
//  Copyright © 2020 Mohamed Elshaer. All rights reserved.
//

import Foundation

class UserDefultsManger {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefultsManger()
    
    class func shared() -> UserDefultsManger {
        return UserDefultsManger.sharedInstance
    }
    
    // MARK:- Properties
    private let defaults = UserDefaults.standard
    
    var school: Int {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.school)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.school) != nil else {
                return 0
            }
            return defaults.integer(forKey: UserDefaultsKeys.school)
        }
    }
    var method: Int {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.method)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.method) != nil else {
                return 4
            }
            return defaults.integer(forKey: UserDefaultsKeys.method)
        }
    }
    var city: String {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.city)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.city) != nil else {
                return "..."
            }
            return defaults.string(forKey: UserDefaultsKeys.city) ?? "..."
        }
    }
    var sound: Int {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.sound)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.sound) != nil else {
                return 1
            }
            return defaults.integer(forKey: UserDefaultsKeys.sound)
        }
    }
    var lat: Double {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.lat)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.lat) != nil else {
                return 21.422510
            }
            return defaults.double(forKey: UserDefaultsKeys.lat)
        }
    }
    var log: Double {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.log)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.log) != nil else {
                return 39.826168
            }
            return defaults.double(forKey: UserDefaultsKeys.log)
        }
    }
    var didChange: Bool {
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.didChange)
        }
        get {
            guard defaults.object(forKey: UserDefaultsKeys.didChange) != nil else {
                return false
            }
            return defaults.bool(forKey: UserDefaultsKeys.didChange)
        }
    }
}
