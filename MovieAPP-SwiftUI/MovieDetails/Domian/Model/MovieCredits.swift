//
//  MovieDetailsModel.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import Foundation

struct MovieCredits: Codable, Identifiable {
    let id: Int
    let cast: [Cast]
}
