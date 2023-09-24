//
//  TrendingMoviesResult.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation

struct TrendingMoviesResult: Codable {
    
    let page: Int
    let result: [TrendingMovieItem]
}
