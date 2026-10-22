//
//  SpotifyCategoryCell.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/23/26.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "Music"
    var isSelected: Bool = true
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .themeColor(isSelected: isSelected)
            .cornerRadius(15)
    }
}

extension View {
    func themeColor(isSelected: Bool) -> some View {
        self
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifywhite)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack (spacing: 40) {
            SpotifyCategoryCell(title: "what is this", isSelected: false)
            SpotifyCategoryCell(title: "welcome", isSelected: true)
            SpotifyCategoryCell(title: "all", isSelected: true)
        }
    }
}
