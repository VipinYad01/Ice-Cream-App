//
//  AddedToCart.swift
//  Ice Cream App
//
//  Created by vipin on 23/04/25.
//

import SwiftUI

struct AddedToCart: View {
    var numberOfProducts : Int = 1
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Added to Cart...")
                    .font(.system(size: 22,weight: .semibold))
                
                Spacer()
                ZStack(alignment : .topTrailing){
                    Image(systemName: "cart.fill")
                        .font(.system(size: 25,weight: .semibold))
                    
                    if(numberOfProducts>0){
                        Text("\(numberOfProducts)")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                            .background (.red)
                    }
                    
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("GrayOwn"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
        .ignoresSafeArea(.all)

    

    }
}

#Preview {
    AddedToCart()
}
