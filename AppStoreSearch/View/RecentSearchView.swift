//
//  RecentSearchView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct RecentSearchView: View {
    @ObservedObject var trieWrapper: TrieWrapper
    @Binding var inputText: String
    
    var onSubmit: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text("최근 검색어")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Divider()
            
            List {
                ForEach(trieWrapper.getAllWords(), id: \.self) { result in
                    Text(result)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.blue)
                        .background()
                        .onTapGesture {
                            inputText = result
                            onSubmit()
                        }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    RecentSearchView(trieWrapper: TrieWrapper(words: []), inputText: .constant(""), onSubmit: {})
}
