//
//  MainView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-15.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        
        if authVM.userLoggedIn {
            
            if authVM.userRole == "tenant" {
                TenantHomeView()
            }
            else if authVM.userRole == "landlord" {
                LandlordDashboardView()
            }
            
        } else {
            
            GuestHomeView()
            
        }
    }
}

#Preview {
    MainView()
}
