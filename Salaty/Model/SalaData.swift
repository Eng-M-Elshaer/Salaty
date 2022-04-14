//
//  SalaData.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import Foundation

// MARK: - SalaData
struct SalaData: Codable {
    let code: Int
    let status: String
    let data: [TimeData]
}

// MARK: - TimeData
struct TimeData: Codable {
    let timings: Timings
    let date: SalaDate
}

// MARK: - Timings
struct Timings: Codable {
    let fajr, dhuhr, asr: String
    let maghrib, isha: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case maghrib = "Maghrib"
        case isha = "Isha"
    }
}

// MARK: - SalaDate
struct SalaDate: Codable {
    let readable, timestamp: String
}

// MARK:- Parameters
struct SalatyParameters: Codable {
    var method: Int?
    var school: Int?
    var year: Int?
    var month: Int?
    var lat: Double?
    var log: Double?
}
