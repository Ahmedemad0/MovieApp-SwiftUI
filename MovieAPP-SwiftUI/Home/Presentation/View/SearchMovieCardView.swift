//
//  SearchMovieCardView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import SwiftUI

struct SearchMovieCardView: View {
    
    let trendingMovie: TrendingMovieItem

    var body: some View {
        HStack {
            AsyncImage(url: trendingMovie.backDropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 120)
            }
            .clipped()
            .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(trendingMovie.title)
                    .foregroundColor(.white)
                    .font(.headline)
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingMovie.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(Color(red: 61/255, green: 61/255, blue: 88/255))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
