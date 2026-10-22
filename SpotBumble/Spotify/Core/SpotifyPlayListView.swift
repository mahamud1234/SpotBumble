//
//  SpotifyPlayListView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/27/26.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlayListView: View {
    
    @Environment(\.router) var router
    var product: Product = .mock
    var user : User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    
    var body: some View {
        ZStack  {
            Color.spotifyBlack
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(
                    spacing: 10
                ) {
                    PlayListHeaderCell(
                        height: 250,
                        imagename: product.thumbnail,
                        title: product.title ,
                        subtitle: product.description 
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 170
                    }
                    
                    PlayListDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheader: product.brand ?? "",
                        onAddToPlaylist: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onElipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach( products ) { product in
                        SongRowCell(
                            title: product.title,
                            brand: product.brand,
                            imageUrl: product.firstImage,
                            imageSize: 55,
                            onCellPressed: {
                                goToPlayListView(product: product)
                            },
                            onElipsisPressed: {
                            }
                        )
                    }
                }
            }
            .scrollIndicators(.hidden )
            
            header
            .frame( maxHeight: .infinity, alignment: .top )
            
        }
        
        
        .task {
            await getData()
        }
        .toolbar(
            .hidden,
            for: .navigationBar
        )
    }
    
    //    func that get data from the database
    
    private func getData() async {
        do {
            products = try await DatabaseHelper()
                .getProducts()
        } catch  {
            
        }
    }
    
    private func goToPlayListView(product: Product) {
        router.showScreen(.push){ _ in
            SpotifyPlayListView(product: product, user: user)
        }
    }
    
    private var header: some View {
        ZStack {
            Text(product.title)
                .font(.headline)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background( .spotifyBlack )
                .offset( y: showHeader ? 0 : -40 )
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.spotifyGray.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifywhite)
        .animation(.smooth(duration: 0.3), value: showHeader)
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlayListView()
    }
}
