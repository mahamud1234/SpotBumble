//
//  BumbleHomeView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/30/26.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct BumbleHomeView: View {
    
    @Environment(\.router) var router
    @State private var filter: [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_fiter") var selectedFilter: String = "Everyone"
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffset: [Int:Bool] = [:] // userId : (Direction is Right == true )
    @State private var currentSwipeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                header
                
                /*
                 BumbleFilterView(
                     options: filter,
                     selection: Binding(
                         get: { selectedFilter },
                         set: { newText in selectedFilter = newText }
                     )
                 )
                 */
                
                BumbleFilterView(
                    options: filter,
                    selection: $selectedFilter
                )
                .background(Divider(), alignment: .bottom)
                
//                BumbleCardView()
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id:\.offset) { (index, user) in
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index
                            if  isPrevious || isCurrent || isNext {
                                
                                let offsetValue = cardOffset[user.id]
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900: -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                    .zIndex(9999)
                    
                }
                .frame(maxHeight: .infinity)
                .animation(.smooth, value: cardOffset)
                
            }
            .padding(8)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    // create a function for swiping
    private func userDidSelet(index: Int, isLike: Bool){
        let user = allUsers[index]
        cardOffset[user.id] = isLike
        
        selectedIndex += 1
    }
    
    //    func that get data from the database
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch  {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.bumbleYellow)
            
            Image(systemName: "slider.horizontal.3")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push){ _ in
                        BumbleChatsView()
                    }
                }
                
        }
        .foregroundColor(.bumbleBlack)
        .font(.title2)
        .fontWeight(.semibold)
    }
    
    private func userProfileCell(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            onTapsuperlikePressed: nil,
            onTapHideAndReportPressed: nil,
            onTapCheckmarkPressed: {
                userDidSelet(
                    index: index,
                    isLike: false
                )
            },
            onTapXmarkPressed: {
                userDidSelet(
                    index: index,
                    isLike: true
                )
            },
            onTapSendAComplimentPressed: {
                
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            rotationMultiplier: 1.05,
            //                                        scaleMultiplier: <#T##CGFloat#>,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width < -50 {
                    userDidSelet(
                        index: index,
                        isLike: false
                    )
                } else if dragOffset.width > 50 {
                    userDidSelet(
                        index: index,
                        isLike: true
                    )
                    }
                }
            )
    }
    
    private var overlaySwipingIndicators : some View {
        ZStack{
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay(
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1)
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay(
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1)
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .animation(.smooth, value: currentSwipeOffset)
    }
}

#Preview {
    
    RouterView { _ in
        BumbleHomeView()
    }
}
