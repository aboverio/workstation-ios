//
//  SignInView.swift
//  Workstation
//
//  Created by Adam Rafiandri on 07/21/22.
//

import SwiftUI

struct AuthEmailView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    private enum Field: Int, Hashable {
        case email
    }
    
    @FocusState private var focusedField: Field?
    
    @State private var email: String = ""
    
    private enum ContinueResult {
        case signin
        case signup
    }
    
    @State private var continueResult: ContinueResult?
    
    private var closeButton: some View {
        Button("Close") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func handleContinue() {
        continueResult = .signup
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Your Email")
                    .textCase(.uppercase)
                    .font(.callout)
                    .padding(.leading)
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    )
                    .focused($focusedField, equals: .email)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(
                            deadline: .now() + .milliseconds(500)
                        ) {
                            focusedField = .email
                        }
                    }
                    .onSubmit {
                        handleContinue()
                    }
                    .submitLabel(.go)
            }
            
            Button(
                action: handleContinue
            ) {
                Text("Continue")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundStyle(.background)
            .cornerRadius(5)
            
            NavigationLink(
                destination: AuthEmailSignInView(email: email),
                tag: ContinueResult.signin,
                selection: $continueResult
            ) {
                EmptyView()
            }
            NavigationLink(
                destination: AuthEmailSignUpView(email: email),
                tag: ContinueResult.signup,
                selection: $continueResult
            ) {
                EmptyView()
            }
        }
        .padding()
        .navigationBarItems(leading: closeButton)
        .navigationTitle("Continue with Email")
    }
}

struct AuthEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthEmailView()
    }
}
