//
//  ContentView.swift
//  Gym App
//
//  Created by Theo Farris on 1/24/24.
//

import SwiftUI



struct ContentView: View {
    @State private var shouldShowMenu = true
    @State private var selectedTab: Tab = .camera
    @StateObject var viewModel = LoginViewViewModel()
    @State var showPassword: Bool = false
    @State var signInSuccess = false
    @State var showView = false
    @State var showSheet1 = false
    @State var showSheet2 = false
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        
                        VStack{
                            if(tab.rawValue == "leaf") {
                                Button {
                                    showSheet1 = true
                                } label: {
                                    Text("Click Here to Sign In")
                                }
                                .sheet(isPresented: $showSheet1, content: {
                                    SignInView(signedIn: $signInSuccess)
                                })
                                Button {
                                    showSheet2 = true
                                } label: {
                                    Text("Click Here to Register")
                                }
                                .sheet(isPresented: $showSheet2, content: {
                                    RegistrationActivityView(signInSuccess: $signInSuccess)
                                })
                            }
                            else if(tab.rawValue == "camera"){
                                cameraView()
                            }
                            else {
                                ExerciseListView()
                            }
                        }.tag(tab)
                    }
                }
            }
            VStack {
                Spacer()
                navigationBarTest(selectedTab: $selectedTab)
            }
            
        }
    }
}




private let menuItems = ContextMenu {
    Button {
        // Add this item to a list of favorites.
    } label: {
        Label("Click to sign in", systemImage: "heart")
    }
    Button {
        // Open Maps and center it on this item.
    } label: {
        Label("Click to sign out", systemImage: "house.fill")
    }
}

#Preview {
    ContentView()
}

