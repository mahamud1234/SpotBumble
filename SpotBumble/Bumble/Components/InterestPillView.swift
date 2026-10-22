//
//  InterestPillView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/3/26.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "❤️"
    var title: String = "Music"
    
    var body: some View {
        HStack(spacing: 5) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            Text(title)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(32)
    }
}

#Preview {
    VStack{
        InterestPillView(iconName: nil, emoji: "👌", title: "Graduate")
        InterestPillView(iconName: "pin.fill", emoji: nil, title: "music")
        InterestPillView(iconName: nil, emoji: "😊", title: "Graduate")
    }
}
