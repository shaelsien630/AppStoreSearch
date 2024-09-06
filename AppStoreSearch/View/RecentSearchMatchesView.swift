//
//  RecentSearchMatchesView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct RecentSearchMatchesView: View {
    @ObservedObject var trieWrapper: TrieWrapper
    @Binding var inputText: String
    
    var body: some View {
        List {
            ForEach(trieWrapper.search(prefix: inputText), id: \.self) { result in
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Text(result)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    RecentSearchMatchesView(trieWrapper: TrieWrapper(words: []), inputText: .constant(""))
}


