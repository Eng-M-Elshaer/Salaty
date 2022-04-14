//
//  MapVC.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 07/03/2022.
//  Copyright © 2022 Mohamed Elshaer. All rights reserved.
//

import MapKit

// MARK: - MapCenterDelegate Protocol.
protocol MapWithCurrentLocationDelegate {
    func setDelailLocationInAddress(delailsAddress: String, lat: Double, log: Double)
}

class MapVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var mapView: MapView!
    
    // MARK:- Properties
    private let locationManager = CLLocationManager()
    private let regionInMeters: Double = 10000
    private var previuosLocation: CLLocation?
    private var userLocation = ""
    var delegate: MapWithCurrentLocationDelegate?
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.setup()
        mapView?.mapView.delegate = self
        checkLocationServices()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK:- Actions
    @IBAction func submitUserAddressBtnTapped(_ sender: UIButton) {
        let lat = mapView?.mapView.centerCoordinate.latitude
        let log = mapView?.mapView.centerCoordinate.longitude
        delegate?.setDelailLocationInAddress(delailsAddress: userLocation, lat: lat ?? 0.0, log: log ?? 0.0)
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK:- Private Methods
extension MapVC {
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    private func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView?.mapView.setRegion(region, animated: true)
        }
    }
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            self.showAlert(title: L10n.error, message: L10n.pleaseTurnOnLocation)
        }
    }
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    private func startTrackingLocation() {
        mapView?.mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previuosLocation = getCenterLocation(for: mapView.mapView)
    }
    private func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

// MARK:- CLLocationManagerDelegate
extension MapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

// MARK:- MKMapViewDelegate
extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = getCenterLocation(for: mapView)
        let geocoder = CLGeocoder()
        guard self.previuosLocation != nil else { return }
        guard location.distance(from: previuosLocation ?? location) > 50 else {return}
        self.previuosLocation = location
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            self.processResponse(withPlacemarks: placemarks, error: error)
        }
    }
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if error != nil {
            mapView?.userLocationLabel.text = L10n.unableToFind
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                mapView?.userLocationLabel.text = placemark.compactAddress ?? ""
                userLocation = placemark.compactAddress ?? ""
            } else {
                mapView?.userLocationLabel.text = L10n.noMatchingAddresses
                userLocation = L10n.noMatchingAddresses
            }
        }
    }
}
