//
//  LandlordDashboardView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-15.
//

import SwiftUI

struct LandlordDashboardView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Text("Landlord Dashboard")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Manage your rental properties")
                    .foregroundColor(.secondary)
                
                
                Divider()
                
                
                VStack(spacing: 15) {
                    
                    Button("Add Property") {
                        print("Add Property tapped")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    
                    Button("My Properties") {
                        print("My Properties tapped")
                    }
                    .buttonStyle(.bordered)
                    
                    
                    Button("View Requests") {
                        print("View Requests tapped")
                    }
                    .buttonStyle(.bordered)
                }
                
                
                Spacer()
                
                
                Button("Logout") {
                    authVM.logout()
                }
                .foregroundColor(.red)
                
            }
            .padding()
            .navigationTitle("Landlord")
        }
    }
}

#Preview {
    LandlordDashboardView()
        .environmentObject(AuthViewModel())
}
