//
//  Sheet.swift
//  NuovaMappa
//
//  Created by giovanni russo on 13/12/22.
//

import SwiftUI

struct Sheet: View {
    @State var location: Item?
    
    var body: some View {
        VStack{
            
            HStack {
                Text(location!.name)
                    .font(.system(size:30))
                    .padding()
                    .foregroundColor(.white)
            }
            Spacer()
            
            Image(location!.imageName)
                .resizable()
                .frame(width: 290, height: 290)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            
            Text(location!.placeDescription)
                .padding()
                .font(.title3)
            
            Text(location!.time).padding()
                .font(.title3)
            
            Spacer()
            
            Group{
                
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.secondary)
                        .frame(width: 350, height: 70, alignment: .center)
                        .padding()
                    Text(location!.address)
                        .foregroundColor(.black)
                }.padding()
            }
        }
    }
}


