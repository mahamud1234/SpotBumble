//
//  User.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/22/26.
//

import Foundation


// MARK: - UserStruct
struct UserStruct: Codable {
    let users: [User]
    let total: Int
    let skip: Int
    let limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let email: String
    let phone: String
    let username: String
    let password: String
    let birthDate: String
    let image: String
    let university: String
    
    var work: String {
        "iOS App Developer"
    }
    
    var education: String {
        "Graduate Student"
    }
    
    var aboutMe: String {
        "I'm a full-stack developer with a background in education and a passion for creating engaging and user-friendly applications."
    }
    
    var basicInfo: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "6.7'"),
            UserInterest(iconName: "heart", emoji: nil, text: "love"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: "university"),
            UserInterest(iconName: "moon.circle", emoji: nil, text: "verified")
        ]
    }
    
    var interests : [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🫸", text: "Gym"),
            UserInterest(iconName: nil, emoji: "💕", text: "love"),
            UserInterest(iconName: nil, emoji: "🎓", text: "music"),
            UserInterest(iconName: nil, emoji: "😉", text: "reading")
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/id/1020/500/500", "https://picsum.photos/id/1021/600/600","https://picsum.photos/id/1022/700/700"]
    }
    
    /*
     static property. belongs to the type - not an instance
     thats why we see User.mock
     
     let tyler = User(...)
     ❌tyler.mock will not work because mock is a static property on the Type
     
     ✅User.mock - we can access mock through the Type (User) but not an instance of a User
     */
    
    static let mock = User(
            id: 1,
            firstName: "Emily",
            lastName: "Johnson",
            age: 28,
            email: "emily.johnson@example.com",
            phone: "+1 555-123-4567",
            username: "emilyj",
            password: "emilyjpass",
            birthDate: "1996-05-18",
            image: Constants.randomImage,
            university: "University of Michigan"
        )
}
