//
//  ContentView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel =  HomeViewModel(useCases: HomeUseCases())
    @State var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.output.trendingMovies.isEmpty {
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
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(viewModel.output.trendingMovies) { movie in
                                TrendingCardView(trendingMovie: movie)
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
                viewModel.input.searchText = newValue
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
