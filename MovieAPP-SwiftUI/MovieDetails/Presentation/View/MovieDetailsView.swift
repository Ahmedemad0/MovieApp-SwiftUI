//
//  MovieDetailsView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel = MovieDetailsViewModel()
    let movieDetails: TrendingMovieItem
    var body: some View {
        ScrollView {
            AsyncImage(url: movieDetails.backDropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 400)
                } placeholder: {
                    Text("NO PHOTO")
                }
                
                HStack {
                    Text(movieDetails.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text(String(format: "%.1f", 2.0))
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
                    

                }.padding(.horizontal)
            
            HStack {
                ZStack {
                    Text("2020")
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .frame(width: 70, height: 30)
                .background(Color(white: 0.8))
                .cornerRadius(12)
                
                ZStack {
                    Text("Comedy")
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .frame(width: 70, height: 30)
                .background(Color(white: 0.8))
                .cornerRadius(12)
                
                ZStack {
                    Text("Fantasy")
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .frame(width: 70, height: 30)
                .background(Color(white: 0.8))
                .cornerRadius(12)
                
                Spacer()
                HStack {
                    Image(systemName: "clock.fill")
                    Text(String(format: "%.1f", 2.0))
                }
                .foregroundColor(.white)
                .fontWeight(.heavy)
            }
            .padding(.horizontal)
            HStack {
                Text("About Movie")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }.padding()
            Text(movieDetails.overview)
                .font(.body)
                .padding(.horizontal)
                .foregroundColor(Color(white: 0.6))
            HStack {
                Text("Cast & Crew")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.cast) { item in
                        CastCardView(castModel: item)
                    }
                }
                .padding(.horizontal)
            }

                Rectangle()
                .frame(width: 100, height: 50)
                .foregroundColor(.clear)
                Spacer()

        }
        .background(Color(red: 39/255, green: 40/255, blue: 59/255).ignoresSafeArea())
        .ignoresSafeArea()
        .onAppear{
            viewModel.viewDidLoad()
            viewModel.callMovieCredits(movieID: movieDetails.id)
        }
        .navigationBarHidden(true)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView (movieDetails: .preview)
    }
}
