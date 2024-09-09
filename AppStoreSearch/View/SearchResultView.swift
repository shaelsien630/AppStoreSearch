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
                NavigationLink {
                    DetailView(index: index)
                } label: {
                    SearchResultRowView(index: index)
                }
                .listRowSeparator(.hidden)
                .padding(.leading)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    SearchResultView()
        .environmentObject(SearchViewModel())
}
