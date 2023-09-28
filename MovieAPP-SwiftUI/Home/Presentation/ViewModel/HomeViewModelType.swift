//
//  HomeViewModelType.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 26/09/2023.
//

import Combine

protocol HomeViewModelInput {
    func searchMovies(searchText: String)
    func viewDidLoad()
}

protocol HomeViewModelOutput {
    var trendingMovies: [TrendingMovieItem] { get }
    var searchMovies: [TrendingMovieItem] { get }
}

typealias HomeViewModelType = HomeViewModelInput & HomeViewModelOutput


//class AnyHomeViewModelType: ObservableObject, HomeViewModelType {
//    @Published var trendingMovies: [TrendingMovieItem] = []
//    @Published var searchMovies: [TrendingMovieItem] = []
//
//    private let base: HomeViewModelType
//
//    init(_ base: HomeViewModelType = HomeViewModel()) {
//        self.base = base
//    }
//
//    func searchMovies(searchText: String) {
//        base.searchMovies(searchText: searchText)
//    }
//
//    func viewDidLoad() {
//        base.viewDidLoad()
//    }
//}
