//
//  MapView.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 09/03/2022.
//

import MapKit

class MapView: UIView {

    //MARK:- Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var submitLocationButton: UIButton!
    @IBOutlet weak var userLocationLabel: UILabel!
    
    //MARK:- Public Methods
    func setup(){
        self.backgroundColor = .specialPurple
        setupLocationLabel()
        setupSubmitButton()
    }
}

//MARK:- Priavte Methods
extension MapView {
    private func setupLocationLabel(){
        userLocationLabel.textColor = .black
        userLocationLabel.textAlignment = .center
        userLocationLabel.numberOfLines = 0
    }
    private func setupSubmitButton(){
        submitLocationButton.cornerStylish(color: .specialLightPurple)
        submitLocationButton.backgroundColor = .specialLightPurple
        submitLocationButton.setTitle(L10n.submit, for: .normal)
    }
}
