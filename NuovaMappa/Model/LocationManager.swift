//
//  LocationManager.swift
//  NuovaMappa
//
//  Created by giovanni russo on 13/12/22.
//

import Foundation
import SwiftUI
import MapKit

final class Map01Model: NSObject, ObservableObject,
                        CLLocationManagerDelegate{
    
    @Published var region2 = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan
    )// Map coordinate
    
    @Published var pd = false
 
    var locationManager: CLLocationManager?
    
    func checkLocation(){ // check if location service is active
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationManager=CLLocationManager()
            
            locationManager?.delegate = self //set the delegate
            
        }else {
            print("alert turn on the service")
        }
    }
    
    private func checkLocationAuthorization() { //only this metod can call it
        
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined: // case auth is not determined do
            locationManager.requestWhenInUseAuthorization() //request auth
            
        case .restricted: //case auth is restricted
            pd.toggle()
            
        case .denied:
            pd.toggle()
            
        case .authorizedAlways, .authorizedWhenInUse:
            region2 = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //delegate metod
        checkLocationAuthorization()
    }
}

