//
//  ContentView.swift
//  Ice Cream App
//
//  Created by vipin on 07/04/25.
//

import SwiftUI

struct onBoarding {
    var image : String
    var text : String
    var info : String
}

let onBoardingList : [onBoarding] = [
    onBoarding(image: "ice", text: "Scoop into Happiness", info: "Explore a delightful range of ice cream flavors made to match your cravings — from classic to exotic."),
    onBoarding(image: "ice1", text: "Your Scoop, Your Style", info: "Build your perfect treat with custom flavors, toppings, cones, and more."),
    onBoarding(image: "ice2", text: "From Our Freezer to Your Door", info: "Get your favorite ice cream delivered fast and fresh to your doorstep."),
    onBoarding(image: "ice3", text: " Treat Yourself Anytime", info: "Enjoy creamy happiness 24/7 — because there's never a wrong time for ice cream.")
]
    

struct ContentView: View {
    @State private var showHome = false
    var body: some View {
        if showHome {
                 Home(showHome: $showHome)
                .transition(.move(edge: .trailing))
             } else {
                 OnBoardingScreen(showHome: $showHome)
             }    }
}

#Preview {
    ContentView()
}


struct OnBoardingScreen : View {
    @Binding var showHome: Bool
    @State var current : Int = 0
    var body : some View {
        VStack{
            
            HStack{
                Spacer()
                Button {
                   withAnimation {
                        showHome = true
                    }
                } label: {
                    Text("Skip")
                        .foregroundColor(.gray)
                }

            }
            
            
            TabView(selection: $current){
              ForEach(0..<4){ item in
                  VStack{
                        Image(onBoardingList[item].image)
                            .resizable()
                            .frame(width: 350, height: 350)
                        Text(onBoardingList[item].text)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Text(onBoardingList[item].info)
                          .fontDesign(.monospaced)
                            .multilineTextAlignment(.center)
                    }

                  .tag(item)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            
            HStack{
                ForEach(0..<4){ item in
                    if(item == current){
                        Rectangle()
                            .frame(width: 20,height: 10)
                            .cornerRadius(10)
                            .foregroundColor(.purple)
                    }
                    else{
                        Circle()
                            .frame(width: 20,height: 10)
                            .foregroundColor(.gray)
                    }
                }

            }
            .padding(.bottom,25)
            
            
            
            Button {
                withAnimation {
                    if(current<3){
                        current = current+1
                    }
                    else{
                            showHome = true
                  
                    }
                }
            } label: {
                Text(current < 3 ? "Next" : "Get Started")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

           
        }
        .padding(20)
        
    }
}
