//
//  Cast.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation


struct Cast: Codable, Identifiable {
    let id: Int
    let name: String
    let profile_path: String?
    
    var profilePathURL: URL? {
        let basURL = URL(string: "https://image.tmdb.org/t/p/w200")!
        return basURL.appending(path: profile_path ?? "")
        
    }
}
