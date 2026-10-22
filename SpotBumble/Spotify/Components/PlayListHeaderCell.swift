//
//  PlayListHeaderCell.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/27/26.
//

import SwiftUI
import SwiftfulUI




struct PlayListHeaderCell: View {
    
    var height: CGFloat = 300
    var imagename: String = Constants.randomImage
    var title: String = "Playlist Name"
    var subtitle: String = "Playlist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist SubtitlePlaylist Subtitle"
    var shadowColor: Color = .spotifyBlack.opacity(0.75)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoaderView( urlString: imagename )
            )
            .overlay(
                VStack (alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
                .foregroundStyle(.spotifywhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                ,
                alignment: .bottomLeading
                
                
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(edges: .all)
        ScrollView {
            PlayListHeaderCell()
        }
        .ignoresSafeArea(edges: .all)
    }
}
