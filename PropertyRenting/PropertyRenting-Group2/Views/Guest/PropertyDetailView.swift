//
//  PropertyDetailView.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import SwiftUI

struct PropertyDetailView: View {
    
    var property: Property
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                // Property Image
                AsyncImage(url: URL(string: property.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 260)
                .clipped()
                
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    // Title
                    Text(property.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    // Location
                    Label(property.location, systemImage: "location")
                        .foregroundColor(.secondary)
                    
                    
                    // Price
                    Text("$\(property.price) / month")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    
                    Divider()
                    
                    
                    // Property Features
                    HStack(spacing: 30) {
                        
                        HStack {
                            Image(systemName: "bed.double.fill")
                            Text("\(property.bedrooms) Bedrooms")
                        }
                        
                        HStack {
                            Image(systemName: "bathtub.fill")
                            Text("\(property.bathrooms) Bathrooms")
                        }
                    }
                    .font(.subheadline)
                    
                    
                    Divider()
                    
                    
                    // Description
                    Text("Description")
                        .font(.headline)
                    
                    Text(property.description)
                        .foregroundColor(.secondary)
                    
                }
                .padding()
                
            }
        }
        .navigationTitle("Property Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PropertyDetailView(
        property: Property(
            title: "Sample Property",
            location: "Toronto",
            price: 2000,
            bedrooms: 2,
            bathrooms: 1,
            description: "Beautiful apartment in downtown Toronto close to transit and restaurants.",
            imageURL: "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688"
        )
    )
}
