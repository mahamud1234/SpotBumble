//
//  Product.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/22/26.
//

import Foundation


// MARK: - Product
struct ProductStruct: Codable {
    
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

// MARK: - ProductElement
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let brand: String?
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let images: [String]
    let thumbnail: String
    let sku: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static let mock = Product(
        id: 1,
        title: "Essence Mascara Lash Princess",
        description: "A popular mascara known ",
        brand: "Essence",
        price: 9.99,
        discountPercentage: 7.17,
        rating: 4.94,
        images: [
            Constants.randomImage,
            Constants.randomImage,
            Constants.randomImage
        ],
        thumbnail: Constants.randomImage,
        sku: "RCH45Q1A"
    )

}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
