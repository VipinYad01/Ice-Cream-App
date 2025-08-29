//
//  ProfileView.swift
//  Ice Cream App
//
//  Created by vipin on 26/05/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showAlert = false
    @Binding var showHome  : Bool
    @State var showFullscreen : Bool = false
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading,spacing: 20){
                    Button {
                        showFullscreen = true
                    } label: {
                        headerView()
                    }
                    settings()
                    VStack(spacing: 10){
                        Button {
                            showAlert = true
                        } label: {
                            Text("Log out")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(.blue)
                        }
                        .alert(isPresented: $showAlert){
                        Alert(
                            title: Text("Log Out ?"),
                            message: Text("You will be logged out of your account."),
                            primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Yes")) {
                                withAnimation {
                                    showHome = false
                                }
                            }
                        )
                    }
                        Text("Version 1.5")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .offset(x:UIScreen.main.bounds.width/2.75)
                }
                
                
            }
            .padding()
            .scrollIndicators(.hidden)
            .background(Color(.systemGray4))
            .fullScreenCover(isPresented: $showFullscreen) {
                editView()
            }
        }
    }
}

#Preview {
    ProfileView(showHome: .constant(true))
}

struct  headerView: View {
    var body: some View {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image("vipin")
                        .resizable()
                        .frame(width: 60, height: 70)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        Text("Vipin Yadav")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(.black)
                        Text("View and edit profile")
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                }
               
                Divider()
                
            }
    }
}

struct settings: View {
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Account")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "phone.connection.fill")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Contact Us")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
            
        }
        HStack{
            Image(systemName: "translate")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Languages")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "location")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Location")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "star.circle")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Subscription")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "archivebox")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Clear cahche")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "clock")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Clear History")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        HStack{
            Image(systemName: "gear")
                .font(.system(size: 30, weight: .light))
                .frame(width: 60, height: 40)
            Text("Settings")
                .font(.system(size: 20, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 15, weight: .medium))
        }
        
        HStack(){
            Spacer()
            Link(destination: URL(string: "https://www.instagram.com/vipin.swift/")!) {
                Image("insta")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            Spacer()
            Link(destination: URL(string: "https://www.linkedin.com/in/vipin--49b20927b/")!) {
                Image("linked")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
            Link(destination: URL(string: "https://x.com/vipin01_dev")!) {
                Image("x")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
           
            Spacer()
        }
        Divider()

    }
}

struct editView: View {
    @State private var aboutText: String = ""
    @State private var livesText: String = ""
    @State private var worksText: String = ""
    @State private var schoolText: String = ""
    @State private var languagesText: String = ""

    @Environment(\.dismiss) var dismiss
    var buttonWidth : CGFloat = UIScreen.main.bounds.width - 40
    var body : some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                        .padding(.bottom)
                }
                    Text("Profile Photo")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Please select a profile photo that shows your face. It'll help guests and hosts recognize you at the beginning of the trip.")
                    Text("About")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Tell hosts and guests about yourself and why you're a responsible, trustworthy person. Share your favorite travel experience.")
                    Text("About")
                        .font(.footnote)
                        .foregroundStyle(.black)
                TextField("Tell people about yourself", text: $aboutText)                        .textFieldStyle(.roundedBorder)

                    Text("Lives")
                        .font(.footnote)
                        .foregroundStyle(.black)
                TextField("London, UK / Paris, France", text: $livesText)
                        .textFieldStyle(.roundedBorder)

                    Text("Works")
                        .font(.footnote)
                        .foregroundStyle(.black)
                TextField("Tech / Non-tech / Finance ", text: $worksText)
                        .textFieldStyle(.roundedBorder)

                    Text("School")
                        .font(.footnote)
                        .foregroundStyle(.black)
                TextField("NYU / SF State", text: $schoolText)
                        .textFieldStyle(.roundedBorder)

                    Text("Languages")
                        .font(.footnote)
                        .foregroundStyle(.black)
                TextField("English,French...", text: $languagesText)
                        .textFieldStyle(.roundedBorder)
                Spacer()
                    .frame(height: 100)

                

            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .scrollIndicators(.hidden)
        .background(Color(.systemGray4))
        .overlay {
            VStack {
                Spacer()
                ZStack {
                    Color(.systemGray4)
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                    Button {
                        
                    } label: {
                        Text("Save")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width: buttonWidth, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)

        
    }
}
