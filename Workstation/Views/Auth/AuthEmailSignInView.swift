//
//  AuthEmailSignInView.swift
//  Workstation
//
//  Created by Adam Rafiandri on 07/21/22.
//

import SwiftUI

struct AuthEmailSignInView: View {
    var email: String
    
    private enum Field: Int, Hashable {
        case password
    }
    
    @FocusState private var focusedField: Field?
    
    @State private var password: String = ""
    
    private func handleSignIn() {
        
    }
    
    var body: some View {
        Text("Using **\(email)** for signing in.")
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.leading)
        
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Your Password")
                    .textCase(.uppercase)
                    .font(.callout)
                    .padding(.leading)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    )
                    .focused($focusedField, equals: .password)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(
                            deadline: .now() + .milliseconds(500)
                        ) {
                            focusedField = .password
                        }
                    }
                    .onSubmit {
                        handleSignIn()
                    }
                    .submitLabel(.go)
            }
            
            Button(
                action: handleSignIn
            ) {
                Text("Sign In")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundStyle(.background)
            .cornerRadius(5)
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

struct AuthEmailSignInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthEmailSignInView(email: "adam@abover.io")
    }
}
