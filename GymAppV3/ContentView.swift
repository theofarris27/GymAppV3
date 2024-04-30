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
                             if(tab.rawValue == "home"){
                                NavigationLinkView()
                            }
                            else if(tab.rawValue == "camera") {
                                cameraView()
                            }
                        }
                            .tag(tab)
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

