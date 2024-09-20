//
//  RatingView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/20/24.
//

import SwiftUI

struct RatingView: View {
    var rating: Double

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                let currentStarRating = Double(index) + 1.0
                if currentStarRating <= rating {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                } else if currentStarRating - 0.5 <= rating {
                    Image(systemName: "star.leadinghalf.filled")
                        .resizable()
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .resizable()
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 12, height: 12)
        }
    }
}

#Preview {
    RatingView(rating: 3.5)
}
