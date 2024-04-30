//
//  SignInView.swift
//  Gym App
//
//  Created by Theo Farris on 3/5/24.
//

import SwiftUI

struct SignInView: View {
    @Binding var signedIn: Bool
    @StateObject var viewModel = LoginViewViewModel()
    @State var showPassword: Bool = false
    @State var signInSuccess = false
    @State var showView = false
    @State var showSheet = false
    var isSignInButtonDisabled: Bool {
        [viewModel.email, viewModel.password].contains(where: \.isEmpty)
      }
    
    
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.largeTitle)
            TextField("Name",
                      text: $viewModel.email ,
                      prompt: Text("Login").foregroundColor(.blue)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            
            .padding(15)
            
            HStack {
                Group {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    if showPassword {
                        TextField("Password", // how to create a secure text field
                                  text: $viewModel.password,
                                  prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                    } else {
                        
                        SecureField("Password", // how to create a secure text field
                                    text: $viewModel.password,
                                    prompt: Text("Password").foregroundColor(.red)) // How to change the color of the TextField Placeholder
                    }
                }
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.red, lineWidth: 2) // How to add rounded corner to a TextField and change it colour
                }
                
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red) // how to change image based in a State variable
                }
                
            }.padding(.horizontal)
            
            
            
            
            Button {
                viewModel.login()
                GymAppV3App.signedIn = true
            } label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontaly
            .background(
                isSignInButtonDisabled ? // how to add a gradient to a button in SwiftUI if the button is disabled
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .disabled(isSignInButtonDisabled) // how to disable while some condition is applied
            .padding()
            Button {
                showSheet = true
            } label: {
                Text("Click Here To Regsiter")
            }.sheet(isPresented: $showSheet, content: {
                RegistrationActivityView()
            })
        }
    }
}

#Preview {
    ContentView()
}
