//
//  HomeViewModel.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import SwiftUI
import Combine


class HomeViewModel: ObservableObject, HomeViewModelType {
    
    

    @Published var trendingMovies: [TrendingMovieItem] = []
    @Published var searchMovies: [TrendingMovieItem] = []


    var anyCancellable = Set<AnyCancellable>()
    let useCases: HomeUseCases
    
    init(useCases: HomeUseCases = HomeUseCases()) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        callTrendingMovies()
    }
    
    func callTrendingMovies(){
        useCases.getTrendingMovies().receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] movies in
                self.trendingMovies = movies.results
            }.store(in: &anyCancellable)
    }
    
    func searchMovies(searchText: String){
        useCases.searchMovies(search: searchText).receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] searchMovies in
                self.searchMovies = searchMovies.results
                print(searchMovies)
                
            }.store(in: &anyCancellable)
    }
}
