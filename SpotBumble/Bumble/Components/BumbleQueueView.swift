//
//  BumbleQueueView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/9/26.
//

import SwiftUI

struct BumbleQueueView: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double =  Double.random(in: 0...1)
    var hasNewMassage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay(
            ZStack {
                if hasNewMassage {
                    Circle()
                        .fill(.bumbleWhite)
                        
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                        .offset(x: 2, y: 2)
                }
            }
                .frame(width: 24, height: 24)
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    BumbleQueueView(hasNewMassage: false)
    BumbleQueueView(percentageRemaining: 0.1)
    BumbleQueueView(percentageRemaining: 1)
    BumbleQueueView()
}
