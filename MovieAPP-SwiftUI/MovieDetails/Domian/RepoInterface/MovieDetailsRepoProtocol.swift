//
//  MovieDetailsRepoProtocol.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation
import Combine

protocol MovieDetailsRepoProtocol {
    func getCastCredts(movieID: Int) -> AnyPublisher<MovieCredits, Error>
}
