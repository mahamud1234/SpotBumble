//
//  BumbleChatsView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/9/26.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    
    @Environment(\.router) var router
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack {
                header
                    .padding(.vertical, 16)
                matchQueueSection
                    .padding(.vertical, 16)
                chatSection
            }
        }
        
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
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
        HStack (spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
        .padding(.horizontal, 16)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Match Queue (\(Text("\(allUsers.count)")))")
                .foregroundStyle(.bumbleGray)
                .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16){
                    ForEach(allUsers) { user in
                        BumbleQueueView(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMassage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chatSection: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Chats (Recent)")
                .foregroundStyle(.bumbleGray)
                .padding(.horizontal, 16)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16){
                    ForEach(allUsers) { user in
                        BumbleProfileDetailsView(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMassage: Bool.random(),
                            userName: user.firstName,
                            lastMassage: user.aboutMe,
                            isMove: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleChatsView()
}
