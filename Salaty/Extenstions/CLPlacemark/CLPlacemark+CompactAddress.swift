//
//  CLPlacemark+Compact.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//

import MapKit

extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            if let city = locality {
                result += ", \(city)"
            }
            if let country = country {
                result += ", \(country)"
            }
            return result
        }
        return nil
    }
}
