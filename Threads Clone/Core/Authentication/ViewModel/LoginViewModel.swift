//
//  LoginViewModel.swift
//  Threads Clone
//
//  Created by Garrett Hanberg on 9/3/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }
}
