//
//  ContentView.swift
//  NuovaMappa
//
//  Created by giovanni russo on 06/12/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    private enum Field: Int, CaseIterable{
        case search
    }
    
    @StateObject private var MapModel = Map01Model() //location service check
    
    @State private var text = "" // search bar
        
    @State var isSearching = false // search bar tap check
    
    @State private var selectedPlace: MaplocClass? // used for annotations sheet
    
    @State var newLatitude = 40.837208 //used fof
    
    @State var newLongitude = 14.306232
        
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
                            
                        } else if location.silentPlace{
                            
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
                    }
                }
            })
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            .onAppear{
                
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
                    
                }
                .padding()
                .background()
                .cornerRadius(6)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    
                    if !isSearching{
                        isSearching.toggle()}})
                
                .onSubmit{
                    
                    focusOnPoint()
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
                    }.background(Color.white)
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
                }
            }
        } //end ZStack
    }
    
    var searchResults: [MaplocClass] {
        if text.isEmpty {
            return MapLocationsClass
        } else {
            return MapLocationsClass.filter { $0.name.contains(text) }
        }
    }//search a point
    
    func focusOnPoint(){
        if let idx = searchResults.firstIndex(where: { $0.name.contains(text)}) {
            newLongitude = searchResults[idx].longitude
            newLatitude = searchResults[idx].latitude
        }
    }// center map on the annotation
    
    func focusLocation(){
        MapModel.region2 = MKCoordinateRegion(center: CLLocationManager().location?.coordinate ?? MapDetails.startingLocation, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        
    }// center map on the user location if location service is running
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
