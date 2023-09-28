//
//  MovieDetailsUseCases.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation
import Combine

class MovieDetailsUseCases {
    let repo: MovieDetailsRepoImplementation
    
    init(repo: MovieDetailsRepoImplementation = MovieDetailsRepoImplementation()) {
        self.repo = repo
    }
    func getCastCredits(movieID: Int) -> AnyPublisher<MovieCredits, Error> {
        repo.getCastCredts(movieID: movieID)
    }
}
