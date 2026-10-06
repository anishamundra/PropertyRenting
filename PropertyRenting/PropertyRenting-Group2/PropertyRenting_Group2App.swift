//
//  PropertyRenting_Group2App.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import SwiftUI
import FirebaseCore

@main
struct PropertyRenting_Group2App: App {
    
    @StateObject var authVM = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authVM)
        }
    }
}
