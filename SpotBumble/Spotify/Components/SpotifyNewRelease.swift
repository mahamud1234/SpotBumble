//
//  SpotifyNewRelease.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/24/26.
//

import SwiftUI

struct SpotifyNewRelease: View {
    var imageName: String = Constants.randomImage
    var heading: String? = "New Releases"
    var subHeading: String? = "Discover new music"
    var title: String? = "Discover new music"
    var subtitle: String? = "Browse the latest albums and EPs"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack (spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    if let heading {
                        Text(heading)
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.callout)
                    }
                    if let subHeading {
                        Text(subHeading)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifywhite)
                            .lineLimit(1)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .foregroundStyle(.spotifywhite)
                                .fontWeight(.semibold)
                                
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGrey)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    .padding(.top, 10)
                    HStack (spacing: 0) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding(4)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.white)
                            .font(.title2)
                            
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColor(isSelected: false)
            .cornerRadius(10)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SpotifyNewRelease()
            .padding()
    }
}
