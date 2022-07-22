//
//  SignUpView.swift
//  Workstation
//
//  Created by Adam Rafiandri on 07/21/22.
//

import SwiftUI

struct AuthEmailSignUpView: View {
    var email: String
    
    @State private var name: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Using **\(email)** for signing up.")
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Name")
                    .textCase(.uppercase)
                TextField("Name", text: self.$name)
                    .textFieldStyle(.roundedBorder)
                
                Text("Your Password")
                    .textCase(.uppercase)
                SecureField("Password", text: self.$password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Sign Up") {
                    
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

struct AuthEmailSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AuthEmailSignUpView(email: "adam@abover.io")
    }
}
