//
//  ImageTitleRowCell.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/25/26.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var image: String = Constants.randomImage
    var title: String = "Title of the song"
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(urlString: image)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGrey)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack  {
        Color.black.edgesIgnoringSafeArea(.all)
        ImageTitleRowCell()
    }
}
