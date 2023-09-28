//
//  Coordinator.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import SwiftUI

enum Page: String, Identifiable {
    
    case home, details
//    case details(model: TrendingMovieItem)
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Page){
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popRoot(){
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(_ page: Page)-> some View {
        switch page {
        case .home:
            HomeView()
        case .details:
            MovieDetailsView(movieDetails: .preview)
        }
    }
}
