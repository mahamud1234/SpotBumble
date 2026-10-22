//
//  ImageLoaderView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/22/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                /*
                 .fit → you see the whole picture, but there may be empty space.
                 .fill → you see no empty space, but part of the picture may be cut off.
                 */
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
        
        
        
        
            
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(20)
        .padding(40)
        .padding(.vertical, 60)
    
}
