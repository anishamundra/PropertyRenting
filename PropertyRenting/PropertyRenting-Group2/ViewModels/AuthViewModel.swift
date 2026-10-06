//
//  AuthViewModel.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-15.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userLoggedIn = false
    @Published var userRole: String = ""
    
    private var db = Firestore.firestore()
    
    // Register User
    func register(email: String, password: String, name: String, role: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Register error:", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let userData: [String: Any] = [
                "name": name,
                "email": email,
                "role": role
            ]
            
            self.db.collection("users").document(uid).setData(userData)
            
            DispatchQueue.main.async {
                self.userLoggedIn = true
                self.userRole = role
            }
        }
    }
    
    // Login User
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Login error:", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            self.fetchUserRole(uid: uid)
        }
    }
    
    // Fetch Role
    func fetchUserRole(uid: String) {
        
        db.collection("users").document(uid).getDocument { snapshot, error in
            
            if let data = snapshot?.data() {
                
                let role = data["role"] as? String ?? ""
                
                DispatchQueue.main.async {
                    self.userRole = role
                    self.userLoggedIn = true
                }
            }
        }
    }
    
    //Logout
    func logout() {
        
        try? Auth.auth().signOut()
        
        userLoggedIn = false
        userRole = ""
    }
}
