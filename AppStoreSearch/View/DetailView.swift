//
//  DetailView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var index: Int
    @State var isExpanded: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 16) {
                    AsyncImage(url: URL(string: searchViewModel.apps[index].iconImageURL)) { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(searchViewModel.apps[index].title)
                            .lineLimit(nil)
                            .font(.title3)
                            .bold()
                        
                        Text(searchViewModel.apps[index].genres[0])
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .frame(height: 100)
                .padding(.horizontal)
                
                Divider()
                
                HStack(alignment: .center, spacing: 10) {
                    VStack(alignment: .center, spacing: 8) {
                        Text("\(searchViewModel.apps[index].ratingCount)개의 평가")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(String(format: "%.2f", searchViewModel.apps[index].ratingScore))
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                        RatingView(rating: searchViewModel.apps[index].ratingScore)
                    }
                    .frame(width: 100)
                    
                    
                    
                    Divider()
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("연령")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("\(searchViewModel.apps[index].recommenedAge)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.gray)
                        Text("세")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 100)
                    
                    Divider()
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text("개발자")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Image(systemName: "person.crop.square")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                        Text("\(searchViewModel.apps[index].developerID)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 120)
                }
                .padding(.horizontal, 20)
                
                Divider()
                
                // 스크린샷 표시
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<searchViewModel.apps[index].screenShotURLList.count, id: \.self) { screenIndex in
                            if let screenshotURL = searchViewModel.apps[index].screenShotURLList[safe: screenIndex] {
                                AsyncImage(url: URL(string: screenshotURL)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 220, height: 400)
                                        .cornerRadius(12)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 220, height: 400)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack(alignment: .top, spacing: 20) {
                    Text(searchViewModel.apps[index].longDescription)
                        .frame(maxWidth: .infinity, maxHeight: isExpanded ? .infinity : 100, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        if !isExpanded {
                            Button {
                                isExpanded.toggle()
                            } label: {
                                Text("더보기")
                                    .padding()
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    return DetailView(index: 0)
        .environmentObject(SearchViewModel())
}
