//
//  SearchbarMenu.swift
//  NuovaMappa
//
//  Created by giovanni russo on 13/12/22.
//

import SwiftUI

struct SearchbarMenu: View {
    
    @State var searchResults: [MaplocClass]
    @State var text: String
    var body: some View {
        
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
        
        
        
    }
}

struct SearchbarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarMenu()
    }
}
