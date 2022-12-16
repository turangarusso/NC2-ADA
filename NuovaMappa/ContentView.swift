//
//  ContentView.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order:.reverse)]) var mapAnnotations: FetchedResults<Item>
    
    
    private enum Field: Int, CaseIterable{
        case search
    }
    
    @StateObject private var MapModel = Map01Model() //location service check
    
    @State private var text = "" // search bar
        
    @State var isSearching = false // search bar tap check
    
    @State var selectedPlace: Item? // used for annotations sheet
    
    @State var newLatitude = 40.837208 //used for focus
    
    @State var newLongitude = 14.306232 //used for focus
        
    var body: some View {
        ZStack{
            
            Map(coordinateRegion: $MapModel.region2, showsUserLocation: true,
                annotationItems: searchResults,
                annotationContent:
                    {
                location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude,
                                                                 longitude: location.longitude))
                {
                    
                    VStack {
                        
                        if location.loudPlace {
                            
                            Image(systemName: "network")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedPlace = location
                                }
                            
                                .sheet(item: $selectedPlace) { location in
                                    
                                    Sheet(location: location)
                                }
                            
                        } else {
                            
                            Image(systemName: "books.vertical.circle")
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 30, height: 30)
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedPlace = location
                                }
                            
                                .sheet(item: $selectedPlace) { location in
                                    
                                    Sheet(location: location)
                                }
                        }
                        Text(location.name)
                            .frame(width: 70, height: 50)
                    }//End VStack
                }
            })
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            .onAppear{
                alloca()
                UIApplication.shared.addTapGestureRecognizer()
                MapModel.checkLocation()
                
            }// check on appear if location service is active
            
            .alert(isPresented: $MapModel.pd, content: {
                
                Alert(title: Text("Permission denied"), message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Go to Settings"), action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    
                }))
            }) //end Alert popup for locations settings
            
            VStack(alignment: .center){
                
                HStack{
                    
                    TextField(" What are you looking for?", text: $text) //search bar
                        .padding(.leading, 24.0)
                        .padding(.horizontal, 24.0)
                    
                }//End HStack
                .padding()
                .background()
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    
                    if !isSearching{
                        isSearching.toggle()}})
                
                .onSubmit{
                    
//                    focusOnPoint()
                    MapModel.region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                    
                }
                .submitLabel(.search)
                .overlay(
                    HStack{
                        
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching && text != ""{
                            Button(action: { text = ""}, label: {Image(systemName: "xmark.circle")})
                            
                        }// show delete search text button
                        
                    }.padding(.horizontal, 32) )
                
                if text != "" && !searchResults.isEmpty {
                    ScrollView{
                        
                        VStack(spacing: 1){
                            ForEach(searchResults){location in
                                
                                Text(location.name)
                                
                                    .fontWeight(.bold)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 50, alignment: .leading)
                                    .onTapGesture {
                                        
                                        MapModel.region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                                        text = ""
                                        
                                    }
                                Text(location.address)
                                    .font(.system(size: 12, weight: .light))
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 50, alignment: .leading)
                                
                                Divider()
                                
                            }
                        }.padding()
                    }.background(Color.white)//End ScrollView
                        .opacity(30)
                        .cornerRadius(6)
                }
                
                Spacer()
            }//end VStack
            .padding()
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {focusLocation()}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding()
                    })
                }//end HStack
            }//end VStack
        } //end ZStack
    }//end Body
    
    //MARK: -searchResults definition
    
    var searchResults: Array<Item>{
        if text.isEmpty {
            return mapAnnotations.filter {annotation in annotation == annotation}
        } else {
            return mapAnnotations.filter {annotation in  annotation.name.contains(text) }
        }
    }//search a point

    
    //MARK: -focusOnPoint

    func focusOnPoint(){
        if let idx = searchResults.firstIndex(where: { $0.name.contains(text)}) {
            newLongitude = searchResults[idx].longitude
            newLatitude = searchResults[idx].latitude
        }
    }// center map on the annotation
    
    //MARK: -focusLocation
    
    func focusLocation(){
        MapModel.region2 = MKCoordinateRegion(center: CLLocationManager().location?.coordinate ?? MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
    }// center map on the user location if location service is running
    
    func alloca(){
            
        let farework = Item(context: moc)
        farework.name = "Farework"
        farework.latitude = 40.95431635643521
        farework.longitude = 14.45121566599237
        farework.loudPlace = false
        farework.point = false
        farework.silentPlace = false
        farework.address = "CVico I Gagliardi, 6, 80137 Napoli NA"
        farework.placeDescription = "In this location you can drink potable water for free."
        farework.imageName = "Fareworkpic"
        farework.time = "This point is open daily from 8:00 to 19:00, closed on Sundays"
        
        let newBook2 = Item(context: moc)
        newBook2.name = "Rework"
        newBook2.latitude = 40.85709466786785
        newBook2.longitude = 14.282754853822746
        newBook2.loudPlace = true
        newBook2.point = false
        newBook2.silentPlace = false
        newBook2.address = "Viale della Costituzione, 80143 Napoli NA"
        newBook2.placeDescription = "A coworking space in the center of Naples."
        newBook2.imageName = "Reworkpic"
        newBook2.time = "This point is open daily from 8:00 to 19:00, closed on Sundays"
        
        let universityLibrary = Item(context: moc)
        universityLibrary.name = "Biblioteca Universitaria"
        universityLibrary.latitude = 40.847181
        universityLibrary.longitude = 14.256984
        universityLibrary.loudPlace = false
        universityLibrary.point = false
        universityLibrary.silentPlace = true
        universityLibrary.address = "Via Giovanni Paladino, 39, 80134 Napoli NA"
        universityLibrary.placeDescription = "In this location you can drink potable water for free."
        universityLibrary.imageName = "Bun"
        universityLibrary.time = "This point is open daily from 8:00 to 19:00, closed on Sundays"
        
        let library = Item(context: moc)
        library.name = "Vittorio Emanuele"
        library.latitude = 40.836848
        library.longitude = 14.250992
        library.loudPlace = false
        library.point = false
        library.silentPlace = true
        library.address = "Piazza del Plebiscito, 1, 80132 Napoli NA"
        library.placeDescription = "In this location you can study or work for free."
        library.imageName = "BiblioVittorio"
        library.time = "This point is open daily from 8:00 to 19:00, closed on Sundays"
        
        if moc.hasChanges{
            try? moc.save()
            //dismiss()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
