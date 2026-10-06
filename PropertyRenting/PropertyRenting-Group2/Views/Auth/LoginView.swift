//
//  LoginView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Toggle("Remember Me", isOn: $rememberMe)
                
                Button("Login") {
                    loginUser()
                    authVM.login(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)
                
                NavigationLink("Create Account") {
                    RegisterView()
                        .environmentObject(authVM)
                }
                
            }
            .padding()
            .onAppear {
                loadSavedCredentials()
            }
        }
    }
    
    func loginUser() {
        
        if rememberMe {
            UserDefaults.standard.set(email, forKey: "savedEmail")
            UserDefaults.standard.set(password, forKey: "savedPassword")
        } else {
            UserDefaults.standard.removeObject(forKey: "savedEmail")
            UserDefaults.standard.removeObject(forKey: "savedPassword")
        }
        
        print("Login pressed")
    }
    
    func loadSavedCredentials() {
        
        if let savedEmail = UserDefaults.standard.string(forKey: "savedEmail"),
           let savedPassword = UserDefaults.standard.string(forKey: "savedPassword") {
            
            email = savedEmail
            password = savedPassword
            rememberMe = true
        }
    }
}

#Preview {
    LoginView()
}
