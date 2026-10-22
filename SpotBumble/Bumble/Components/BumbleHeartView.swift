//
//  BumbleHeartView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/1/26.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 50, height: 50)
            
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.title)
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleWhite)
                .font(.caption)
        }
    }
}

#Preview {
    BumbleHeartView()
}
