//
//  SearchResultRowView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct SearchResultRowView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var index: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .center, spacing: 14) {
                // 앱 아이콘
                AsyncImage(url: URL(string: searchViewModel.apps[index].iconImageURL)) { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                        .frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    // 앱 타이틀과 서브타이틀
                    Text(searchViewModel.apps[index].title)
                        .font(.callout)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text(searchViewModel.apps[index].longDescription)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    // 별점과 리뷰 개수
                    HStack {
                        RatingView(rating: searchViewModel.apps[index].ratingScore)
                        Text("\(searchViewModel.apps[index].ratingCount)만")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 5)
                }
                
                Spacer()
                
                // 앱 설치 버튼
                Button(action: {
                    // 앱 설치 버튼 동작
                }) {
                    Text("받기")
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 60, height: 30)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .padding(.horizontal)
            
            
            // 앱 스크린샷
            HStack(spacing: 10) {
                ForEach(0..<3) { screenIndex in
                    if let screenshotURL = searchViewModel.apps[index].screenShotURLList[safe: screenIndex] {
                        AsyncImage(url: URL(string: screenshotURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 115, height: 220)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 115, height: 220)
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 115, height: 220)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    return SearchResultRowView(index: 0)
        .environmentObject(SearchViewModel())
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
