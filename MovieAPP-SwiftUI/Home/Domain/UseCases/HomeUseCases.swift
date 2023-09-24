//
//  HomeUseCases.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation
import Combine

class HomeUseCases {
    private let repo: HomeRepoImplementation
    
    init(repo: HomeRepoImplementation = HomeRepoImplementation()) {
        self.repo = repo
    }
    
    func getTrendingMovies()-> AnyPublisher<TrendingMoviesResult, Error> {
        repo.getTrendingMovies()
    }
    
    func searchMovies(search: String)-> AnyPublisher<TrendingMoviesResult, Error>{
        repo.searchMovies(search: search)
    }
}
