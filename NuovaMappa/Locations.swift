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
