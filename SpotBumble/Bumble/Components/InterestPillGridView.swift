//
//  InterestPillGridView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/3/26.
//

import SwiftUI
import SwiftfulUI

struct UserInterest : Identifiable, Hashable {
    let id = UUID().uuidString
    var iconName: String?
    var emoji: String?
    var text: String
}

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.interests
        
    
    var body: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .leading,
            spacing: 8,
            items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        title: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
    }
}

#Preview {
    VStack {
        InterestPillGridView(interests: User.mock.interests)
        InterestPillGridView(interests: User.mock.basicInfo)
    }
}
