//
//  HomeRepoImplementation.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation
import Combine

class HomeRepoImplementation: HomeRepoProtocol {
    let homeNetwork: HomeRemoteRepo
    
    init(homeNetwork: HomeRemoteRepo = HomeNetwork()) {
        self.homeNetwork = homeNetwork
    }
    func getTrendingMovies() -> AnyPublisher<TrendingMoviesResult, Error> {
        homeNetwork.getTrendingMovies()
    }
    
    func searchMovies(search: String)-> AnyPublisher<TrendingMoviesResult, Error>{
        homeNetwork.searchMovies(search: search)
    }

}
