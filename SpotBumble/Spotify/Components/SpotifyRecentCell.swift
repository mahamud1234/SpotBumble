//
//  SpotifyRecentCellTile.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/24/26.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "hello "
    
    var body: some View {
        HStack (spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        
        .cornerRadius(8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
        
    }
}
