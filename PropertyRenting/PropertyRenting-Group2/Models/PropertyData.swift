//
//  PropertyData.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import Foundation

struct PropertyData {
    
    static let sampleProperties: [Property] = [
        
        Property(
            title: "2 Bedroom Apartment",
            location: "Toronto",
            price: 2200,
            bedrooms: 2,
            bathrooms: 1,
            description: "Spacious apartment near downtown.",
            imageURL: "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688"
        ),
        
        Property(
            title: "1 Bedroom Condo",
            location: "North York",
            price: 1800,
            bedrooms: 1,
            bathrooms: 1,
            description: "Modern condo close to subway station.",
            imageURL: "https://images.unsplash.com/photo-1493809842364-78817add7ffb"
        ),
        
        Property(
            title: "3 Bedroom House",
            location: "Scarborough",
            price: 2600,
            bedrooms: 3,
            bathrooms: 2,
            description: "Perfect family home with backyard.",
            imageURL: "https://images.unsplash.com/photo-1564013799919-ab600027ffc6"
        )
        
    ]
}
