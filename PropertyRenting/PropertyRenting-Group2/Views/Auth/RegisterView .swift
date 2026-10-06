//
//  RegisterView .swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-15.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var role = "tenant"
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Role", selection: $role) {
                Text("Tenant").tag("tenant")
                Text("Landlord").tag("landlord")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Register") {
                
                authVM.register(
                    email: email,
                    password: password,
                    name: name,
                    role: role
                )
                
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
