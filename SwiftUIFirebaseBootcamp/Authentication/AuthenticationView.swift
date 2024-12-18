//
//  AuthenticationView.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Thais Souza on 17/12/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink{
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign In With Email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                }
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}

#Preview {
    AuthenticationView(showSignInView: .constant(false))
}
