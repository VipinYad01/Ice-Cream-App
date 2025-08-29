//
//  Home.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import SwiftUI

struct Home: View {
    @Binding var showHome  : Bool
    @State var tab : Int = 0
    @State var addedincart : Bool = false
    @StateObject var manager = CartManager()
    var body: some View {
        ZStack {
            TabView(selection: $tab) {
                
                homeNavigation(showPopup: $addedincart)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                
                LocationView()
                    .tabItem {
                        Image(systemName: "location.fill")
                        Text("Location")
                    }
                    .tag(1)
                
                
                BillView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .tag(2)
                 
                
                
                ProfileView(showHome: $showHome)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(3)
                
                
                
            }
            .accentColor(.pink)
            
            if addedincart{
                    AddedToCart()
                    .transition(.move(edge: .bottom))
            }
            
        }
        .environmentObject(manager)
    }
}

#Preview {
    Home(showHome: .constant(true))

}


// Home Navigation
struct homeNavigation : View {
    @Binding var showPopup : Bool
    
    // CATEGORY VIEW PROPERTIES
    @State var selectedCategory : String = "Grapes 🍇"
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    // HEADER
                    HStack{
                        Text("Crafted to Melt Hearts **Served Cold**")
                            .font(.system(size: 32))
                        
                        Spacer()
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 55 , height: 75)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.5)
                            })
                    }
                    .padding(20)
                    categoryListView
                    
                    // COLLECTION VIEW
                    HStack{
                        Text("Ice Cream **Collection**")
                            .font(.system(size: 24))
                        
                        NavigationLink {
                            AllView(addedincart: $showPopup)
                        } label: {
                            Spacer()
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            
                        }
                          
                    }
                    .padding(20)
                    
                    // PRODUCT CARD VIEW
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(){
                            ForEach(productList){ item in
                                ProductCardView(showPopup: $showPopup, item: item)
                                
                                
                            }
                        }
                    }
                    TypesOfIceCreama(showPopup: $showPopup)
                    Divider()
                    Bars(showPopup: $showPopup)
                    
                }
                
            }
            
        }
    }
        
        // CATEGORY LIST VIEW
        var categoryListView : some View{
            HStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(categoryList){ item in
                            Button {
                                withAnimation {
                                    selectedCategory = item.title
                                }
                            } label: {
                                Text(item.title)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(20)
                                    .background(selectedCategory == item.title ? Color.black : Color.clear)
                                    .foregroundColor(selectedCategory == item.title ? Color.white : Color.black)
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
            }
        }
    }

// Product Card View
struct ProductCardView: View {
    @EnvironmentObject var manager : CartManager
    @Binding var showPopup : Bool
    var item : ProductView
    var body: some View {
        ZStack{
            Image("bg1")
                .frame(width: 350 , height: 400)
                .cornerRadius(15)
            Image(item.image)
                .resizable()
                .frame(width: 250 , height: 250)
            
            
             
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.system(size: 30 , weight: .semibold))
                Text(item.category)
                    .font(.system(size: 20 , weight: .semibold))
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.6))
                    .clipShape(Capsule())
                Spacer()
                HStack{
                
                    Text(String(format: "$%.2f", item.price))
                        .font(.system(size: 24 , weight: .semibold))
                    
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
                    
                        Image(systemName: "cart.fill.badge.plus")
                            .font(.system(size: 20))
                            .imageScale(.large)
                            .frame(width: 90 , height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 88)
                .background(.white.opacity(0.5))
                .clipShape(Capsule())

            }
            .padding(20)
  
        }
        .padding(20)
       
       
    }
}


struct Bars: View {
    @State var current :Int = 0
    @Binding var showPopup : Bool
    var total : Int = BarsList.count
    var body: some View {
        VStack{
            HStack{
                Text("Exclusive Bars **Collection**")
                    .font(.system(size: 24))
                    .frame(width: 210)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                  
            }
            .padding(.horizontal, 20)
            ZStack{
                TabView(selection: $current) {
                    ForEach(0..<BarsList.count, id: \.self) { index in
                        BarsCardView(showPopup: $showPopup, item: BarsList[index], current: $current, total: BarsList.count)
                            .tag(index) // 🔑 Tag each view with its index
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 450)
                HStack{
                    Button {
                        withAnimation{
                            if current > 0 {
                                 current -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.compact.left")
                            .font(.system(size: 50))
                            .foregroundColor(current == 0 ? .black.opacity(0.2) : .black)
                           
                    }
                    Spacer()
                    Button {
                        withAnimation{
                            if current < total - 1 {
                                current += 1
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.compact.right")
                            .font(.system(size: 50))
                            .foregroundColor(current == total-1 ? .black.opacity(0.2) : .black)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


struct BarsCardView: View {
    @EnvironmentObject var manager : CartManager
    @Binding var showPopup : Bool
    @State var quantity : Int = 0
    var item : BarsView
    @Binding var current: Int
    var total: Int
    var body: some View {
            VStack(spacing: 35){
                Image(item.image)
                    .resizable()
                    .frame(width: 280 , height: 130)
                Text(item.name)
                    .font(.system(size: 30 , weight: .semibold))
                    .lineLimit(3)
                    .frame(maxWidth: 250, alignment: .center)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    Text(String(format: "$%.2f", item.price))
                        .font(.system(size: 40 , weight: .semibold))
                        .foregroundColor(.green)
                    Spacer()
                        .frame(width: 60)
                    Button {
                          if quantity>0{
                              quantity = quantity-1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .font(.system(size: 30 , weight: .semibold))
                            .frame(width: 55,height: 55)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(quantity == 0 ? .black.opacity(0.2) : .black)
                    }
                    Text("\(quantity)")
                        .font(.system(size: 35 , weight: .semibold))
                        .frame(width: 45)
                      
                    Button {
                        quantity = quantity + 1                    }
                    
                    label: {
                        Image(systemName: "plus")
                            .font(.system(size: 30 , weight: .semibold))
                            .frame(width: 55,height: 55)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(.black)
                        
                    }
                    

                }
                Button {
                    if quantity >= 1{
                           withAnimation {
                            showPopup = true
                        }
                        // Hide after 1 second
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showPopup = false
                            }
                            
                        }
                    }
                    if quantity >= 1{
                        manager.addToCart(name: item.name, image: item.image,price: Double(quantity) * item.price , type: "bar")
                    }
                   
                }
                label: {
                    HStack{
                        Text("Add to Cart")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "cart.fill.badge.plus")
                            .font(.system(size: 20))
                            .imageScale(.large)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical,20)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .clipShape(Capsule())
                    .padding(.horizontal,40)
                }
            }

    }
}
