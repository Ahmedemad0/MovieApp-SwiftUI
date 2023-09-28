//
//  MovieDetailsViewModel.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation
import Combine

protocol MovieDetailsViewModelProtocol: ObservableObject {
    func viewDidLoad()
    func callMovieCredits(movieID: Int)
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {

    @Published var movieCredits: MovieCredits?
    @Published var movieDetails: TrendingMovieItem?

    @Published var cast: [Cast] = []
    
    var anyCancellable = Set<AnyCancellable>()
    var useCases = MovieDetailsUseCases()
    
    init( useCases: MovieDetailsUseCases = MovieDetailsUseCases()) {
        self.useCases = useCases
    }
    
    func viewDidLoad(){
    }
    
    func callMovieCredits(movieID: Int) {
        useCases.getCastCredits(movieID: movieID).receive(on: DispatchQueue.main)
            .sink { finished in
                print(finished)
            } receiveValue: {[unowned self] movieCredits in
                self.movieCredits = movieCredits
                self.cast = movieCredits.cast
            }.store(in: &anyCancellable)
    }
}
