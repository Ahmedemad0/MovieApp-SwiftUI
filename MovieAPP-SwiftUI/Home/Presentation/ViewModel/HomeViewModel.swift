//
//  HomeViewModel.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation
import Combine

protocol ViewModel: AnyObject {
    associatedtype Input
    associatedtype OutPut
}
protocol HomeViewModelProtocol {
    var input: HomeViewModel.Input {get}
    var output: HomeViewModel.OutPut {get}
    func viewDidLoad()
}

class HomeViewModel: ObservableObject, HomeViewModelProtocol, ViewModel {
    
    
    class Input {
        var searchText: String = ""
    }
    
    class OutPut {
        @Published var trendingMovies: [TrendingMovieItem] = []
        @Published var searchMovies: [TrendingMovieItem] = []
    }
    
    var input: Input = .init()
    var output: OutPut = .init()
    var anyCancellable = Set<AnyCancellable>()
    let useCases: HomeUseCases
    
    init(useCases: HomeUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        callTrendingMovies()
        searchMovies(searchText: input.searchText)
    }
    
    func callTrendingMovies(){
        useCases.getTrendingMovies().receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] movies in
                self.output.trendingMovies = movies.result
            }.store(in: &anyCancellable)
    }
    
    func searchMovies(searchText: String){
        useCases.searchMovies(search: searchText).receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] searchMovies in
                self.output.searchMovies = searchMovies.result
            }.store(in: &anyCancellable)
    }
}
