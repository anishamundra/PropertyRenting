//
//  GuestHomeView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import SwiftUI

struct GuestHomeView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var showLogin = false
    @State private var searchText = ""
    
    var filteredProperties: [Property] {
        
        if searchText.isEmpty {
            return PropertyData.sampleProperties
        }
        
        return PropertyData.sampleProperties.filter {
            $0.location.lowercased().contains(searchText.lowercased()) ||
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            List(filteredProperties) { property in
                
                NavigationLink {
                    PropertyDetailView(property: property)
                } label: {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        AsyncImage(url: URL(string: property.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 180)
                        .clipped()
                        .cornerRadius(10)
                        
                        Text(property.title)
                            .font(.headline)
                        
                        Text(property.location)
                            .font(.subheadline)
                        
                        Text("$\(property.price) / month")
                            .foregroundColor(.green)
                    }
                    .padding(.vertical, 5)
                }
            }
            .listStyle(.plain)
            .navigationTitle("RentHub")
            .searchable(text: $searchText, prompt: "Search by city or title")
            
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        showLogin = true
                    } label: {
                        Image(systemName: "person.circle")
                            .font(.title2)
                    }
                }
            }
            
            .sheet(isPresented: $showLogin) {
                LoginView()
                    .environmentObject(authVM)
            }
        }
    }
}

#Preview {
    GuestHomeView()
}
