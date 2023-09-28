//
//  MovieDetailsNetwork.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation
import Combine

protocol MovieDetailsRemoteRepo {
    func getCastCredits(movieID: Int) -> AnyPublisher<MovieCredits, Error>}

class MovieDetailsNetwork : MovieDetailsRemoteRepo {
    
    func getCastCredits(movieID: Int) -> AnyPublisher<MovieCredits, Error> {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=ab8ca7862f2733af2356c592de5f9d45&language=en-US"
        let movie = SessionManager.instance.request(from: url, MovieCredits.self)
        return movie
    }
    
}
