//
//  DatabaseHelper.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/22/26.
//

import Foundation

struct DatabaseHelper {
        func getProducts() async throws -> [Product]{
            guard let url = URL(string: "https://dummyjson.com/products") else {
                throw URLError(.badURL)
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let products1 = try JSONDecoder().decode(ProductStruct.self, from: data)
            return products1.products
        }
        func getUsers() async throws -> [User]{
            guard let url = URL(string: "https://dummyjson.com/users") else {
                throw URLError(.badURL)
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let users1 = try JSONDecoder().decode(UserStruct.self, from: data)
            return users1.users
        }
    
        
    }


