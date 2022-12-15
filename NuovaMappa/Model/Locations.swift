//
//  Locations.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import Foundation
import MapKit
import SwiftUI


class MaplocClass: Identifiable {
        
    let name: String
    
    let latitude: Double
    
    let longitude: Double
    
    let loudPlace: Bool
    
    let point: Bool
    
    let silentPlace: Bool
    
    let address: String
    
    let description: String
    
    let imageName: String
    
    let time: String
    
    init(name: String, latitude: Double, longitude: Double, loudPlace: Bool, point: Bool, silentPlace: Bool, address: String, description: String, imageName: String, time: String){
        
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.loudPlace = loudPlace
        self.point = point
        self.silentPlace = silentPlace
        self.address = address
        self.description = description
        self.imageName = imageName
        self.time = time
        
    }
        
    
}



enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.84282162142999, longitude: 14.304645339313645)
    
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
}
