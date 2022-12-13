//
//  Sheet.swift
//  NuovaMappa
//
//  Created by giovanni russo on 13/12/22.
//

import SwiftUI

struct Sheet: View {
    @State var location: MaplocClass
    
    var body: some View {
        VStack{
            
            HStack {
                Text(location.name)
                    .font(.system(size:30))
                    .padding()
                    .foregroundColor(.white)
            }
            Spacer()
            
            Image(location.imageName)
                .resizable()
                .frame(width: 290, height: 290)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Text(location.description)
                .padding()
                .font(.title3)
            
            Text(location.time).padding()
                .font(.title3)
            
            Spacer()
            
            Group{
                
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.secondary)
                        .frame(width: 350, height: 70, alignment: .center)
                        .padding()
                    Text(location.address)
                        .foregroundColor(.black)
                }.padding()
            }
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet(location: MaplocClass(name: "Farework", latitude: 40.85431635643521, longitude: 14.25121566599237, loudPlace: true, point: false, silentPlace: false, address: "CVico I Gagliardi, 6, 80137 Napoli NA", description: "A coworking space near the National Archaeological Museum of Naples.", imageName: "Fareworkpic", time: "This point is open daily from 8:00 to 19:00, closed on Sundays"))
    }
}
