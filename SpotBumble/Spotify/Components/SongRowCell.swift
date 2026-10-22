//
//  SongRowCell.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/28/26.
//

import SwiftUI

struct SongRowCell: View {
    
    var title: String = "Iphone 12"
    var brand: String? = "Apple"
    var imageUrl: String = Constants.randomImage
    var imageSize: CGFloat = 55
    var onCellPressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            HStack {
                ImageLoaderView(urlString: imageUrl)
                    .frame(width: imageSize, height: imageSize)
                VStack(alignment: .leading, spacing: 6) {
                    Text(title.capitalized)
                        .font(.headline)
                        .foregroundStyle(.spotifywhite)
                    Text(brand ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.spotifyLightGrey)
                }
                .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifywhite)
                .padding(16)
                .background(Color.green.opacity(0.001))
                .onTapGesture {
                    onElipsisPressed?()
                }
        }
        .background(Color.green.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
        
        
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
