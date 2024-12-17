//
//  SettingsView.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Thais Souza on 17/12/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
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
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(showSingInView: .constant(false))
}
