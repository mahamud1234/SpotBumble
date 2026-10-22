//
//  PlayListDescriptionCell.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/27/26.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Mahamudul"
    var subheader: String = "12,000 songs"
    var onAddToPlaylist: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
            madeForYouSection
            
            Text(subheader)
            
            buttomRow
            
            
        }
        .foregroundStyle(.spotifyLightGrey)
        .font(.title3)
        .fontWeight(.medium)
        
        
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            HStack(spacing: 0) {
                Text("Made For ")
                Text(userName)
                    .bold(true)
                    .foregroundStyle(.spotifywhite)
            }
        }
    }
    
    private var buttomRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0){
                Image(systemName: "shuffle")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .padding(8)
                    .background(Color.green.opacity(0.001))
                    .font(.largeTitle)
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.spotifyGreen)
            
        }
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        PlayListDescriptionCell()
            .padding()
    }
}
