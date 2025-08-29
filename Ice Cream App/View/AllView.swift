//
//  AllView.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import SwiftUI

struct AllView: View {
   // @EnvironmentObject var cartManager : CartManager
    @Environment(\.presentationMode) var mode
    @Binding var addedincart : Bool
    var body: some View {
       // ZStack{
             ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        Text("Crafted to Melt Hearts **Served Cold**")
                            .font(.system(size: 32))
                        
                        Spacer()
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 55 , height: 75)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke()
                                        .opacity(0.5)
                                })
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                    .padding(20)
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                        ForEach(productList){ item in
                            smallProductCardView(item: item, showPopup: $addedincart)
                            
                        }
                    })
                    .padding(.horizontal)
                    
                    
                    
                }
                .navigationBarBackButtonHidden()
                
               
            }
      //  }
    }
}

#Preview {
    AllView(addedincart: .constant(true))
        .environmentObject(CartManager())
       
    
    
}










// Small Product Card View

struct smallProductCardView: View {
    @EnvironmentObject var manager : CartManager
    var item : ProductView
    @Binding var showPopup : Bool
    var body: some View {
        ZStack{
            Image("bg3")
                .resizable()
                .frame(width: 170 , height: 200)
                .cornerRadius(15)
                .opacity(0.7)
            Image(item.image)
                .resizable()
                .frame(width: 100 , height: 100)
             
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.system(size: 15 , weight: .semibold))
                    .padding(10)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                Text(item.category)
                    .font(.system(size: 10 , weight: .regular))
                    .font(.callout)
                    .padding(10)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                Spacer()
                
                HStack{
                    Text(String(format: "$%.2f", item.price))
                        .font(.system(size: 12 , weight: .semibold))
                    Spacer()
                    Button {
                        withAnimation {
                            showPopup = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.easeInOut) {
                                showPopup = false
                            }
                            
                            }
                        manager.addToCart(name: item.name, image: item.image,price: item.price , type: "main")
                        
                    } label: {
                        Image(systemName: "basket")
                            .font(.system(size: 10))
                            .imageScale(.large)
                            .frame(width: 35 , height: 25)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }

                    
                }
                .padding(.leading,10)
                .padding(10)
                .frame(maxWidth: .infinity)
                .frame(height: 38)
                .background(.white.opacity(0.8))
                .clipShape(Capsule())

            }
            .padding(20)
  
        }
        .padding(20)
       
       
    }
}

