//
//  HomeNetwork.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation
import Combine

protocol HomeRemoteRepo {
    func getTrendingMovies()-> AnyPublisher<TrendingMoviesResult, Error>
    func searchMovies(search: String)-> AnyPublisher<TrendingMoviesResult, Error>
}

class HomeNetwork : HomeRemoteRepo {
    
    func getTrendingMovies() -> AnyPublisher<TrendingMoviesResult, Error> {
        let url = "https://api.themoviedb.org/3/trending/movie/day?api_key=ab8ca7862f2733af2356c592de5f9d45"
        let movies = SessionManager.instance.request(from: url, TrendingMoviesResult.self)
        return movies
    }
    
    func searchMovies(search: String)-> AnyPublisher<TrendingMoviesResult, Error>{
        let url = "https://api.themoviedb.org/3/search/movie?api_key=ab8ca7862f2733af2356c592de5f9d45&language=en-US&page=1&include_adult=false&aquery=\(search.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)"
        let movies = SessionManager.instance.request(from: url, TrendingMoviesResult.self)
        return movies
    }
}
