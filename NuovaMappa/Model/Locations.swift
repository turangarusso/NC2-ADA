//
//  Locations.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import Foundation
import MapKit
import SwiftUI

//MARK: -MaplocClass

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


let MapLocationsClass = [
    MaplocClass(name: "Farework", latitude: 40.85431635643521, longitude: 14.25121566599237, loudPlace: true, point: false, silentPlace: false, address: "CVico I Gagliardi, 6, 80137 Napoli NA", description: "A coworking space near the National Archaeological Museum of Naples.", imageName: "Fareworkpic", time: "This point is open daily from 8:00 to 19:00, closed on Sundays"),
    MaplocClass(name: "Rework", latitude: 40.85709466786785, longitude: 14.282754853822746, loudPlace: false, point: false, silentPlace: true, address: "Viale della Costituzione, 80143 Napoli NA", description: "A coworking space in the center of Naples.", imageName: "Reworkpic", time: "This point is open daily from 8:00 to 19:00, closed on Sundays"),
    MaplocClass(name: "Biblioteca Universitaria", latitude: 40.847181, longitude: 14.256984, loudPlace: true, point: false, silentPlace: false, address: "Via Giovanni Paladino, 39, 80134 Napoli NA", description: "In this location you can drink potable water for free.", imageName: "Bun", time: "This library is open daily from 8:00 to 19:00, closed on Sundays" ),
    MaplocClass(name: "Biblioteca Vittorio Emanuele", latitude: 40.836848, longitude: 14.250992, loudPlace: false, point: false, silentPlace: true, address: "Piazza del Plebiscito, 1, 80132 Napoli NA", description: "In this location you can study or work for free.", imageName: "BiblioVittorio", time: "This library is open daily from 8:00 to 19:00, closed on Sundays" ),
]

enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 40.84282162142999, longitude: 14.304645339313645)
    
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
}
