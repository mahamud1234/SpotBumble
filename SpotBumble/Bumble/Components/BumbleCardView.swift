//
//  BumbleCardView.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 11/1/26.
//


import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mock
    var onTapsuperlikePressed : (() -> Void)? = nil
    var onTapHideAndReportPressed : (() -> Void)? = nil
    var onTapCheckmarkPressed : (() -> Void)? = nil
    var onTapXmarkPressed : (() -> Void)? = nil
    var onTapSendAComplimentPressed : (() -> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                //header
                header
                    .frame(height: cardFrame.height)
                
                // section title starts
                aboutMeSection
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                
                // MyBasicAndInterests
                MyBasicAndInterests
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                ForEach(user.images, id: \.self){ Image in
                    ImageLoaderView(urlString: Image)
                        .frame(height: cardFrame.height)
                }
                
                // location section
                userLocation
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                // footer section
                footersection
                    .padding(.horizontal, 32)
                    .padding(.vertical, 60)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroungYellow)
        .overlay(alignment: .bottomTrailing, content: {
            superlikeButton
        })

        .clipShape(RoundedRectangle(cornerRadius: 25))
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private var superlikeButton: some View {
        Image(systemName: "hexagon.fill")
            .padding(24)
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60))
            .overlay(alignment: .center) {
                Image(systemName: "star.fill")
                    .font(.system(size: 30, weight: .semibold))
                    
            }
            .onTapGesture {
                onTapsuperlikePressed?()
            }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
            
    }
    // header code starts
    private var header: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                
                HStack {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }
                HStack {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        onTapSendAComplimentPressed?()
                    }
                
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.medium)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .font(.subheadline)
            .foregroundStyle(.bumbleWhite)
            
        }
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12)  {
            sectionTitle(title: "About me")
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            HStack(spacing: 0) {
                BumbleHeartView()
                Text("Send a compliment")
            }
            .padding(.horizontal, 8)
            .background(.bumbleYellow)
            .cornerRadius(25)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    private var MyBasicAndInterests: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Basic")
                InterestPillGridView(
                    interests: user.interests
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Interests")
                InterestPillGridView(
                    interests: user.interests
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var userLocation: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text("\(user.firstName)'s Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(.medium)
            
            Text("10 miles away")
                .font(.headline)
                .foregroundStyle(.bumbleBlack)
            
            InterestPillView(
                iconName: nil,
                emoji: "🇺🇸",
                title: "Lives in the Michigan"
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var footersection: some View {
        VStack(spacing: 24) {
            HStack (spacing: 0) {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(alignment: .center) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onTapXmarkPressed?()
                    }
                Spacer()
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(alignment: .center) {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        onTapCheckmarkPressed?()
                    }
            }
            Text("Hide and Report")
                .font(.headline)
                .foregroundStyle(.bumbleGray)
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onTapHideAndReportPressed?()
                }
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
