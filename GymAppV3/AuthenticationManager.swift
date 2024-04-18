//
//  AuthenticationManager.swift
//  Gym App
//
//  Created by Theo Farris on 3/13/24.
//

import Foundation
import FirebaseAuth

struct authDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
    
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() {}
    
    func getAuthenticatedUser() throws -> authDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return authDataResultModel(user: user)
    }
    
    func createUser(email: String , password: String ) async throws -> authDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return authDataResultModel(user: authDataResult.user)
    }
    
}
