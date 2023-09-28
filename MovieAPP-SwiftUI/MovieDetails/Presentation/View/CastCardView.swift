//
//  CastCardView.swift
//  MovieAPP-SwiftUI
//
//  Created by Ahmed Emad on 25/09/2023.
//

import SwiftUI

struct CastCardView: View {
    let castModel: Cast
    
    var body: some View {
        VStack {
            AsyncImage(url: castModel.profilePathURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .cornerRadius(12)
            } placeholder: {
                Text("NO Photo")
            }

            Text(castModel.name)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}
