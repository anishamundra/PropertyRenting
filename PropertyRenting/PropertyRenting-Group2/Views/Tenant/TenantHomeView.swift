//
//  TenantHomeView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-15.
//

import SwiftUI

struct TenantHomeView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Text("Tenant Dashboard")
                    .font(.largeTitle)
                
                Button("Logout") {
                    authVM.logout()
                }
                
            }
            .navigationTitle("Tenant")
        }
    }
}

#Preview {
    TenantHomeView()
}
