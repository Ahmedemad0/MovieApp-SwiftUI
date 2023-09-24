//
//  TrendingMovieItem.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 24/09/2023.
//

import Foundation


struct TrendingMovieItem: Identifiable, Codable {
    let id: Int
    let adult: Bool
    let poster_path: String
    let backdrop_path:  String
    let title: String
    let vote_average: Float
    
    var backDropURL: URL? {
        let basURL = URL(string: "https://image.tmdb.org/t/p/w308")!
        return basURL.appending(path: backdrop_path)
        
    }
}
