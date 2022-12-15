//
//  Item+CoreDataProperties.swift
//  NuovaMappa
//
//  Created by giovanni russo on 14/12/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String
    @NSManaged public var id: UUID?
    @NSManaged public var silentPlace: Bool
    @NSManaged public var loudPlace: Bool
    @NSManaged public var address: String
    @NSManaged public var placeDescription: String
    @NSManaged public var imageName: String
    @NSManaged public var point: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var time: String

}

extension Item : Identifiable {

}
