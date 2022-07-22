//
//  WelcomeView.swift
//  Workstation
//
//  Created by Adam Rafiandri on 07/21/22.
//

import SwiftUI

struct WelcomeView: View {
    @State private var continueEmail = false
    @State private var continueApple = false
    @State private var continueGoogle = false
    @State private var continueFacebook = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Logo")
            
            Spacer()
            
            Text("On-Boarding Image")
            
            Spacer()
            
            Button(
                action: {
                    self.continueEmail = true
                }
            ) {
                Text("Continue with Email")
            }
            .sheet(isPresented: self.$continueEmail, onDismiss: {
                self.continueEmail = false
            }) {
                NavigationView {
                    AuthEmailView()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundStyle(.background)
            .cornerRadius(5)
            
            Button(
                action: {
                    self.continueApple = true
                }
            ) {
                Text("Continue with Apple")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundStyle(.background)
            .cornerRadius(5)
            
            HStack(spacing: 20) {
                Button(
                    action: {
                        self.continueGoogle = true
                    }
                ) {
                    Text("Google")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundStyle(.background)
                .cornerRadius(5)
                
                Button(
                    action: {
                        self.continueFacebook = true
                    }
                ) {
                    Text("Facebook")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundStyle(.background)
                .cornerRadius(5)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            AppDelegate.orientationLock = .portrait
        }.onDisappear {
            AppDelegate.orientationLock = .all
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
