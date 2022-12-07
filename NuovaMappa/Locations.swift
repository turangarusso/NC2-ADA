//
//  Locations.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import Foundation
import MapKit
import SwiftUI

struct MapLocation: Identifiable {
    
    let id = UUID()
    
    let name: String
    
    let latitude: Double
    
    let longitude: Double
    
    let fontana: Bool
    
    let point: Bool
    
    let recycle: Bool
    
    let address: String
    
    let description: String
    
    let imageName: String
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class MaplocClass: Identifiable {
        
    let name: String
    
    let latitude: Double
    
    let longitude: Double
    
    let fontana: Bool
    
    let point: Bool
    
    let recycle: Bool
    
    let address: String
    
    let description: String
    
    let imageName: String
    
    init(name: String, latitude: Double, longitude: Double, fontana: Bool, point: Bool, recycle: Bool, address: String, description: String, imageName: String){
        
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.fontana = fontana
        self.point = point
        self.recycle = recycle
        self.address = address
        self.description = description
        self.imageName = imageName
        
    }
        
    
}

