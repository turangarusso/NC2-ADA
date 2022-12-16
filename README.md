# NC2-ADA

<h1 align="center">
  <br>
  <a href=""><img src="https://user-images.githubusercontent.com/113531412/208105403-20fa6891-8139-47d1-b628-18e5fdddcbfd.png" alt="StudySpace" width="200"></a>
  <br>
 Study Space
  <br>
</h1>

<h4 align="center">An app that help students to find places where they can study near to them
.</h4>


<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

![screenshot](https://user-images.githubusercontent.com/113531412/208106224-cfe010e8-b35f-4780-9b8e-7388b7f5af8b.png)

## Key Features

* Search Bar
  - Instantly find your point of interest.
* Apple Map implemented with MapKit 
* Show current user location
* Work Offline with CoreData
* Custom Map Annotations for each point of interest
* Show important information about each point of interest


## How To Use

You can build the project using Xcode connected with your Iphone.

Used Framework:

```
import SwiftUI
import MapKit
import CoreData
import Foundation

```
You can add coreData attribute here:

```
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

```

> **Note**
> You need to have Privacy key inside your Custom Ios target properties!


## Credits

Russo Giovanni M.

Carmine Cinquegrana

Sofia Esposito

Filomena Stellino

![photo_2022-12-16_14-04-36](https://user-images.githubusercontent.com/113531412/208109947-a7b591bf-c1ab-405b-8ddc-91cf2a486383.jpg)

## License

MIT

---

