//
//  GymAppV3App.swift
//  GymAppV3
//
//  Created by Theo Farris on 4/18/24.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct GymAppV3App: App {
    @State var signIn = false
static var signedIn = false
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if(GymAppV3App.signedIn) {
                SignInView(signedIn: $signIn)
            }
            else {
                ContentView()
            }
        }
    }
}
