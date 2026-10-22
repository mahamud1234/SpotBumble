//
//  SpotifyHomeView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/23/26.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    
    @Environment(\.router) var router
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRow: [ProductRow]  = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(
                    spacing: 2,
                    pinnedViews: [.sectionHeaders],
                    content: {
                        Section {
                            VStack {
                                recentSections
                                
                                
                                if let firstProduct = products.first {
                                    newRelease(firstProduct: firstProduct)
                                    
                                }
                                
                                // Product rows
                                listRows
                            }
                            
                            
                        } header: {
                            header
                        }
                    })
                .padding(.top, 10)
            }
            .clipped()
        }
        .task {
            await getData()
        }
    }
    //    header start
    
    private var header: some View {
        HStack (spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifywhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 15)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)
    }
    //    header start
    
    private var recentSections: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton (.press) {
                    goToPlayListView(product: product)
                }
            }
        }
    }
    // create function for pressed button in recent section
    
    private func goToPlayListView(product: Product) {
        guard let currentUser else { return }
        
        router.showScreen(.push){ _ in
            SpotifyPlayListView(product: product, user: currentUser)
        }
    }
    
    // list row variable
    
    private var listRows: some View {
        ForEach(productRow) { row in
            VStack(spacing: 10) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifywhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack (alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                           ImageTitleRowCell(
                            imageSize: 120,
                            image: product.firstImage,
                            title: product.title
                           )
                           .asButton (.press) {
                               goToPlayListView(product: product)
                           }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    //    func that get data from the database
    
    private func newRelease (firstProduct: Product ) -> some View {
        SpotifyNewRelease(
            imageName: firstProduct.firstImage,
            heading: firstProduct.title,
            subHeading: firstProduct.description,
            title: firstProduct.title,
            subtitle: firstProduct.description,
            onAddToPlaylistPressed: {},
            onPlayPressed: {
                goToPlayListView(product: firstProduct)
            }
        )
    }
    
    
    //    func that get data from the database
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand ?? ""}))
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRow = rows
        } catch  {
            
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyHomeView()
    }
}
