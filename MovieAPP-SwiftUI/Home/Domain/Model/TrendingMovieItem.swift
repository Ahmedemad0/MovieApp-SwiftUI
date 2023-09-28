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
    let poster_path: String?
    let backdrop_path:  String?
    let title: String
    let vote_average: Float
    let overview: String
    
    var backDropURL: URL? {
        let basURL = URL(string: "https://image.tmdb.org/t/p/w300")!
        return basURL.appending(path: backdrop_path ?? "")
        
    }
    
    
    static var preview: TrendingMovieItem {
        return TrendingMovieItem(id: 23834, adult: false, poster_path: "https://image.tmdb.org/t/p/w300", backdrop_path: "https://image.tmdb.org/t/p/w300", title: "Free Guys", vote_average: 5.6, overview: "Description of free guys movie")
    }
}

