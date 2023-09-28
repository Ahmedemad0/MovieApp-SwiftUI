//
//  ContentView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    @StateObject var viewModel = HomeViewModel()
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Button("push") {
                    coordinator.push(.details)
                }
                if searchText.count < 2 {
                    if viewModel.trendingMovies.isEmpty {
                        HStack {
                            Spacer()
                            Text("NO Movies")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                    }else {
                        HStack {
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trendingMovies) { movie in
                                    // MARK: - Need Some Refacoring
                                    NavigationLink(destination: MovieDetailsView(movieDetails: movie)) {
                                        TrendingCardView(trendingMovie: movie)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }else {
                    ScrollView(.vertical, showsIndicators: false){
                        VStack {
                            ForEach(viewModel.searchMovies) { movie in
                                SearchMovieCardView(movie: movie)
                            }
                        }
                        .padding()
                    }
                }

            }
            .background(Color(red: 39/255, green: 40/255, blue: 59/255).ignoresSafeArea())
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, perform: { newValue in
            if newValue.count > 1 {
                viewModel.searchMovies(searchText: newValue)
            }
        })
        .onAppear{
            viewModel.viewDidLoad()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
