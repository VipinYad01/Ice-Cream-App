//
//  TypesOfIceCreama.swift
//  Ice Cream App
//
//  Created by vipin on 09/04/25.


import SwiftUI

struct TypesOfIceCreama: View {
    @Binding var showPopup: Bool
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            // Your custom tab bar
            HStack {
                Button(action: { selectedTab = 0 }) {
                    Text("Sticks")
                        .padding()
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 115)
                        .foregroundColor(selectedTab == 0 ? .white : .black)
                        .background(selectedTab == 0 ? Color.black : Color.clear)
                        .cornerRadius(10)
          
                }
                Button(action: { selectedTab = 1 }) {
                    Text("Tubs")
                        .padding()
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 115)
                        .foregroundColor(selectedTab == 1 ? .white : .black)
                        .background(selectedTab == 1 ? Color.black : Color.clear)
                        .cornerRadius(10)
                }
                Button(action: { selectedTab = 2 }) {
                    Text("Cones")
                        .padding()
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 115)
                        .foregroundColor(selectedTab == 2 ? .white : .black)
                        .background(selectedTab == 2 ? Color.black : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding()

            Divider()

            // Page content changes with tab
            // Page content changes with tab
            if selectedTab == 0 {
                SectionOneView(showPopup: $showPopup)
            } else if selectedTab == 1 {
                SectionTwoView(showPopup: $showPopup)
            } else if selectedTab == 2 {
                SectionThreeView(showPopup: $showPopup)
            }

            Spacer()
        }
    }
}

#Preview {
    TypesOfIceCreama(showPopup:  .constant(true))
}

// Dummy views for each section
struct SectionOneView: View {
    @Binding var showPopup: Bool
    var body: some View {
        slide1(showPopup: $showPopup)

    }
}



struct SectionTwoView: View {
    @Binding var showPopup: Bool
    var body: some View {
        slide2(showPopup: $showPopup)
    }
}



struct SectionThreeView: View {
    @Binding var showPopup: Bool
    var body: some View {
        slide3(showPopup: $showPopup)
    }
}







struct slide1: View {
    @Binding var showPopup: Bool
    @State var current :Int = 0
    var total : Int = SticksList.count
    var body: some View {
        VStack{
            HStack{
                Text("All Ice Cream **Collection**")
                    .font(.system(size: 24))
                
                Button {
                   
                } label: {
                    Spacer()
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.horizontal, 20)
            ZStack{
                TabView(selection: $current) {
                    ForEach(0..<SticksList.count, id: \.self) { index in
                        SticksCardView(showPopup: $showPopup, item: SticksList[index], current: $current, total: SticksList.count)
                            .tag(index) // 🔑 Tag each view with its index
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 500)
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


struct SticksCardView: View {
    @EnvironmentObject var manager : CartManager
    @Binding var showPopup: Bool
    @State var quantity : Int = 0
    var item : SticksView
    @Binding var current: Int
    var total: Int
    var body: some View {
            VStack(spacing: 35){
                Image(item.image)
                    .resizable()
                    .frame(width: 250 , height: 110)
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
                        quantity = quantity + 1
                    } label: {
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
                        manager.addToCart(name: item.name, image: item.image,price: Double(quantity) * item.price, type: "stick")
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




struct slide2: View {
    @Binding var showPopup: Bool
    @State var current :Int = 0
    var total : Int = TubsList.count
    var body: some View {
        VStack{
            HStack{
                Text("All Ice Cream **Collection**")
                    .font(.system(size: 24))
                
                Button {
                   
                } label: {
                    Spacer()
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.horizontal, 20)
            ZStack{
                TabView(selection: $current) {
                    ForEach(0..<TubsList.count, id: \.self) { index in
                        TubsCardView(showPopup: $showPopup, item: TubsList[index], current: $current, total: TubsList.count)
                            .tag(index) // 🔑 Tag each view with its index
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 500)
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


struct TubsCardView: View {
    @EnvironmentObject var manager : CartManager
    @Binding var showPopup: Bool
    @State var quantity : Int = 0
    var item : TubsView
    @Binding var current: Int
    var total: Int
    var body: some View {
            VStack(spacing: 35){
                Image(item.image)
                    .resizable()
                    .frame(width: 300 , height: 110)
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
                        quantity = quantity + 1
                    } label: {
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
                        manager.addToCart(name: item.name, image: item.image,price: Double(quantity) * item.price, type: "tub")
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




struct slide3: View {
    @Binding var showPopup: Bool
    @State var current :Int = 0
    var total : Int = ConesList.count
    var body: some View {
        VStack{
            HStack{
                Text("All Ice Cream **Collection**")
                    .font(.system(size: 24))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button {
                   
                } label: {
                    Spacer()
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.horizontal, 20)
            ZStack{
                TabView(selection: $current) {
                    ForEach(0..<ConesList.count, id: \.self) { index in
                        ConesCardView(showPopup: $showPopup, item: ConesList[index], current: $current, total: ConesList.count)
                            .tag(index) // 🔑 Tag each view with its index
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 600)
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


struct ConesCardView: View {
    @Binding var showPopup: Bool
    @EnvironmentObject var manager : CartManager
    @State var quantity : Int = 0
    var item : ConesView
    @Binding var current: Int
    var total: Int
    var body: some View {
            VStack(spacing: 35){
                Image(item.image)
                    .resizable()
                    .frame(width: 100 , height: 240)
                    .rotationEffect(Angle(degrees: -20))
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
                        quantity = quantity + 1
                    } label: {
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
                        manager.addToCart(name: item.name, image: item.image,price: Double(quantity) * item.price, type: "cone")
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
