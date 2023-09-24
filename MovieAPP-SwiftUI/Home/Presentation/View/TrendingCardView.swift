//
//  TrendingCardView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import SwiftUI

struct TrendingCardView: View {
    
    let trendingMovie: TrendingMovieItem
    
    
    var body: some View {
        ZStack (alignment: .bottom) {
            AsyncImage(url: trendingMovie.backDropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 280)
            } placeholder: {
                Rectangle()
                    .fill(Color(red: 39/255, green: 40/255, blue: 59/255))
                    .frame(width: 340, height: 280)
            }
            
            VStack {
                HStack {
                    Text(trendingMovie.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingMovie.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .foregroundColor(Color(red: 61/255, green: 61/255, blue: 88/255))
        }
        .cornerRadius(12)
    }
}
