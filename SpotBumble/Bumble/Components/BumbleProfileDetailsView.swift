//
//  BumbleProfileDetailsView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/9/26.
//

import SwiftUI

struct BumbleProfileDetailsView: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double =  Double.random(in: 0...1)
    var hasNewMassage: Bool = true
    
    var userName: String = "Terry"
    var lastMassage: String? = "This is what i think about you and why you are the one"
    var isMove: Bool = true
    
    var body: some View {
        HStack {
            BumbleQueueView(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMassage: hasNewMassage
            )
            VStack (spacing: 4) {
                HStack (spacing: 8) {
                    Text(userName.capitalized)
                        .foregroundStyle(.bumbleBlack)
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isMove {
                        Text("Your move".uppercased())
                            .font(.caption2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(.bumbleYellow)
                            .clipShape(Capsule())
                    }
                }
                if let lastMassage {
                    Text(lastMassage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        .padding(.trailing, 16)
                }
                    
            }
        }
        
    }
}

#Preview {
    VStack {
        BumbleProfileDetailsView(
            userName: "sheldon",
            lastMassage: "This is noy my last time",
            isMove: true
        )
        .padding()
        BumbleProfileDetailsView(isMove: false)
        .padding()
        BumbleProfileDetailsView(
            percentageRemaining: 0.8,
            hasNewMassage: false,
            userName: "Iron",
            lastMassage: "You are the one",
            isMove: true
        )
        .padding()
    }
}
