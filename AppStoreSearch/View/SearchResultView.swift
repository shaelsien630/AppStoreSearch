//
//  SearchResultView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    var body: some View {
        List {
            ForEach(0..<searchViewModel.apps.count, id: \.self) { index in
                SearchResultRowView(index: index)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    SearchResultView()
}
