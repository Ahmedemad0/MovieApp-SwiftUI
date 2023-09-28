//
//  MovieDetailsRepoImplementation.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation
import Combine

class MovieDetailsRepoImplementation: MovieDetailsRepoProtocol {
    let movieDetailsNetwork: MovieDetailsRemoteRepo
    
    init(movieDetailsNetwork: MovieDetailsRemoteRepo = MovieDetailsNetwork()) {
        self.movieDetailsNetwork = movieDetailsNetwork
    }
    
    func getCastCredts(movieID: Int) -> AnyPublisher<MovieCredits, Error> {
        movieDetailsNetwork.getCastCredits(movieID: movieID)
    }

}
