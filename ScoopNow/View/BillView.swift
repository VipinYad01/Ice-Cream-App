//
//  BillView.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import SwiftUI

struct BillView: View {
    @State private var showAlert = false
    @EnvironmentObject var manager: CartManager
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var mobile: String = ""
    @State private var address: String = ""


    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Top Bar
                HStack {
                    Text("**Cart**")
                        .font(.system(size: 50))

                    Spacer()

                    // Cart Count
                    Button {
                        showAlert = true
                    } label: {
                        Text("\(manager.cartItems.count)")
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 75, height: 75)
                            .background(.green)
                            .cornerRadius(50)
                    }

                    // Clear Cart Button
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "xmark.bin.fill")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 55, height: 75)
                            .overlay {
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.5)
                            }
                            .foregroundColor(.black)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Delete cart items?"),
                            message: Text("Are you sure? Your cart will be emptied."),
                            primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Yes")) {
                                withAnimation {
                                    manager.clearCart()
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

                
                if manager.cartItems.isEmpty {
                    VStack {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200) // Reduce space
                } else {
                    List {
                        ForEach(manager.cartItems) { product in
                            Group {
                                if product.type == "stick" {
                                    SticksProductCard(product: product)
                                } else if product.type == "bar" {
                                    BarsProductCard(product: product)
                                } else if product.type == "tub" {
                                    TubsProductCard(product: product)
                                } else if product.type == "cone" {
                                    ConesProductCard(product: product)
                                } else if product.type == "main" {
                                    CartProductCard(product: product)
                                }
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    manager.removeItem(iiid: product.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }


                // Scrollable bottom section
                ScrollView(showsIndicators: false) {
                    VStack {
                        // Total Amount
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Delivery Amount")
                                    .font(.system(size: 30))
                                Spacer()
                                Text("Free")
                                    .font(.system(size: 20, weight: .semibold))
                            }
                            Divider()
                            Text("Total Amount")
                                .font(.system(size: 25))
                            Text(String(format: "$%.2f", manager.totalAmount()))
                                .font(.system(size: 26, weight: .semibold))
                        }
                        .padding(20)
                        .background(.green)
                        .cornerRadius(20)
                        .padding(20)
                        .foregroundColor(.white)

                        // Delivery Instructions
                        VStack(alignment: .leading) {
                            Text("Delivery Address")
                                .font(.system(size: 30, weight: .bold))
                            Divider()

                            Group {
                                Text("First Name")
                                TextField("First Name", text: $firstName)
                                    .textFieldStyle(.roundedBorder)

                                Text("Last Name")
                                TextField("Last Name", text: $lastName)
                                    .textFieldStyle(.roundedBorder)

                                Text("Mobile no.")
                                TextField("91-XXXXX-XXXXX", text: $mobile)
                                    .textFieldStyle(.roundedBorder)

                                Text("Delivery Address")
                                TextField("Delivery Address", text: $address)
                                    .textFieldStyle(.roundedBorder)

                            }
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        }
                        .padding(20)
                        .background(.green)
                        .cornerRadius(20)
                        .padding(20)
                        .foregroundColor(.white)

                        // Make Payment
                        Button {
                            // Add your payment action here
                        } label: {
                            Text("Make Payment")
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .background(.green)
                                .cornerRadius(20)
                                .padding(20)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BillView()
        .environmentObject(CartManager())
}





struct CartProductCard : View {
    var product : CartManager.CartItem
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .frame(width: 80,height: 80)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
            }
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .frame(width: 80 , height: 50)
                .background(.green)
                .cornerRadius(90)
                .foregroundColor(.white)
        }
        .padding(.leading ,20)
        .padding(.trailing ,20)
        .padding(.bottom,30)
    }
        
    }

struct SticksProductCard : View {
    var product : CartManager.CartItem
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .frame(width: 80,height: 40)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
            }
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .frame(width: 80 , height: 50)
                .background(.green)
                .cornerRadius(90)
                .foregroundColor(.white)
        }
        .padding(.leading ,20)
        .padding(.trailing ,20)
        .padding(.bottom,30)
    }
        
    }

struct TubsProductCard : View {
    var product : CartManager.CartItem
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .frame(width: 80,height: 40)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
            }
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .frame(width: 80 , height: 50)
                .background(.green)
                .cornerRadius(90)
                .foregroundColor(.white)
        }
        .padding(.leading ,20)
        .padding(.trailing ,20)
        .padding(.bottom,30)
    }
        
    }

struct ConesProductCard : View {
    var product : CartManager.CartItem
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .frame(width: 40,height: 90)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
            }
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .frame(width: 80 , height: 50)
                .background(.green)
                .cornerRadius(90)
                .foregroundColor(.white)
        }
        .padding(.leading ,20)
        .padding(.trailing ,20)
        .padding(.bottom,30)
    }
        
    }

struct BarsProductCard : View {
    var product : CartManager.CartItem
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .frame(width: 80,height: 40)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                
            }
            Spacer()
            Text(String(format: "$%.2f", product.price))
                .frame(width: 80 , height: 50)
                .background(.green)
                .cornerRadius(90)
                .foregroundColor(.white)
        }
        .padding(.leading ,20)
        .padding(.trailing ,20)
        .padding(.bottom,30)
    }
        
    }

