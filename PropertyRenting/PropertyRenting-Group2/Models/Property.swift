//
//  Property.swift
//  PropertyRenting-Group2
//
//  Created by Anisha Mundra on 2026-03-13.
//

import Foundation

struct Property: Identifiable, Codable {
    
    var id = UUID()
    
    var title: String
    var location: String
    var price: Int
    var bedrooms: Int
    var bathrooms: Int
    var description: String
    var imageURL: String
    
    // Future landlord reference
        var landlordId: String?
        
    // Property status (active / delisted)
    var isListed: Bool = true
}
