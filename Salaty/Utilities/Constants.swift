//
//  Constants.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 01/03/2022.
//

import Foundation

//MARK:- Storyboards
struct Storyboards {
    static let main = "Main"
}

//MARK:- Storyboards
struct ViewController {
    static let mapVC = "MapVC"
}

//MARK:- Urls
struct Urls {
    static let baseUrl = "http://api.aladhan.com/v1/calendar?"
}

//MARK:- Parameters Keys
struct ParameterKey {
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let method = "method"
    static let school = "school"
    static let year = "year"
    static let month = "month"
}

//MARK:- UserDefaults Keys
struct UserDefaultsKeys {
    static let school = "UDKschool"
    static let method = "UDKmethod"
    static let city = "UDKcity"
    static let sound = "UDKsound"
    static let lat = "UDKlat"
    static let log = "UDKlog"
    static let didChange = "UDKdidChange"
}
