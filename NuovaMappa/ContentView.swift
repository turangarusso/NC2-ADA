//
//  ContentView.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import SwiftUI
import MapKit


enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.84282162142999, longitude: 14.304645339313645)
    
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
}
//    .font(.system(size:60))




struct ContentView: View {
    
    
    @StateObject private var MapModel = Map01Model() //location service check
    
    var body: some View {
        Map(coordinateRegion: $MapModel.region2)
            .ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            
            //checkLocationAuthorization() if y dont use the delegate will check only 1 time
            
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            //used ? beacouse y dont know if location service is active
            
            //desiredaccuracy set the precision of the location
            
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
