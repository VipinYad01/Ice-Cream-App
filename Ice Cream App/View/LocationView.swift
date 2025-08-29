//
//  LocationView.swift
//  Ice Cream App
//
//  Created by vipin on 09/04/25.
//

import SwiftUI
import MapKit


struct carLocation : Identifiable {
    let id = UUID()
    let latitude : Double
    let longitude : Double
    var corrdinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}






let locationView = [carLocation(latitude: 43.4632952, longitude: -80.5257256)]








struct LocationView: View {
    @Environment(\.dismiss) var gaya
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.4632952, longitude: -80.5257256),
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    )

    

    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {  // ✅ Correct syntax
                Annotation("Cream Bell", coordinate: CLLocationCoordinate2D(latitude: 43.4632952, longitude:-80.5257256)) {
                        Link(destination: URL(string: "https://www.google.com/maps/place/Four+All+Ice+Cream/@43.4632952,-80.5257256,634m/data=!3m2!1e3!5s0x882bf4129413eab9:0x880decc43979ca47!4m14!1m7!3m6!1s0x882bf53e13cd0147:0xd6f37cec8f4eb068!2sFour+All+Ice+Cream!8m2!3d43.4632952!4d-80.5231507!16s%2Fg%2F11j4y1c_xj!3m5!1s0x882bf53e13cd0147:0xd6f37cec8f4eb068!8m2!3d43.4632952!4d-80.5231507!16s%2Fg%2F11j4y1c_xj?entry=ttu&g_ep=EgoyMDI1MDQwNi4wIKXMDSoASAFQAw%3D%3D")!) {
                            myShop()
                    }

                   }
               }
               .edgesIgnoringSafeArea(.all)
            
            
            LinearGradient(gradient: Gradient(colors: [Color("DarkGray") , .clear , .clear ]), startPoint: .top, endPoint: .bottom )
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
            
            CarLocationPanel()
        }
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)



    }
}

#Preview {
    LocationView()

}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            
            VStack(alignment:.leading , spacing: 10){
                Rectangle()
                    .foregroundColor(.black.opacity(0.4))
                    .frame(width: 60 , height: 4)
                    .cornerRadius(18)
                    .offset(x: 160)
          
                 
                
                Text("Our Shop")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity ,alignment:.leading)
                
   
                Label("20 W 34th St, New Yor, NY 10001", systemImage: "location.fill")
                    .font(.footnote)
                    .opacity(0.5)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Pay tip")
                        .font(.system(size: 25, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity,alignment:.leading )
                    HStack{
                        tipButton(reaction: "☺️", amount: 10)
                        tipButton(reaction: "😎", amount: 20)
                        tipButton(reaction: "🥳", amount: 30)
                        tipButton(reaction: "😍", amount: 40)
                        tipButton(reaction: "🤩", amount: 50)
                    }
                    
                }
                

                Button {
                    
                } label: {
                    Text("Cancel Order")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10 , style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
            .background(Color.white)
            .foregroundColor(.black)
            
            Spacer()
                .frame(height: 80)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct myShop : View {
    var body: some View {
        VStack{
            Image(systemName: "house.lodge.fill")
                .frame(width: 42, height: 42)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
            
        }
    }
}

struct tipButton : View {
    var reaction : String
    var amount : Int
    var body: some View {
        
        Button {
            
        } label: {
            VStack {
                Text("\(reaction)")
                    .font(.system(size: 30))
                Text("\(amount)")
                    .font(.system(size: 20,weight: .semibold))
                    
            }
            .padding()
            .foregroundColor(.white)
            .background(.purple)
            .clipShape(Circle())

        }

    }
}
