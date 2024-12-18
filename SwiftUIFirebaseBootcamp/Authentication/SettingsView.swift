//
//  SettingsView.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Thais Souza on 17/12/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    
    func loadAuthProviders(){
        if let providers = try? AuthenticationManager.shared.getProviders(){
            authProviders = providers
        }
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "thais@novo.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "helloworld"
        
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    
    @Binding var showSingInView: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Button("Log out") {
                    Task {
                        do {
                            try viewModel.signOut()
                            showSingInView = true
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }
                if viewModel.authProviders.contains(.email){
                    emailSection
                }
            }
            .onAppear {
                viewModel.loadAuthProviders()
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(showSingInView: .constant(false))
}


extension SettingsView {
    private var emailSection: some View {
        Section {
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET!")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD UPDATED!")
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATED!")
                    } catch {
                        print(error)
                    }
                }
            }

        } header: {
            Text("Email functions")
        }
    }
}
