//
//  RootView.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Thais Souza on 17/12/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSingInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
            
        }
    }
}

#Preview {
    RootView()
}
