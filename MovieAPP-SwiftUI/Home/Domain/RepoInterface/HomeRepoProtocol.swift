//
//  HomeRepoProtocol.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation
import Combine

protocol HomeRepoProtocol {
    func getTrendingMovies()-> AnyPublisher<TrendingMoviesResult, Error>
    func searchMovies(search: String)-> AnyPublisher<TrendingMoviesResult, Error>
}
