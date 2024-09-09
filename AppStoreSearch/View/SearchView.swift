//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @StateObject var trieWrapper = TrieWrapper(words: ["버스 시간표", "포토샵", "쇼핑", "지하철", "카카오뱅크"])
    @State private var inputText: String = ""
    @State private var isEditing: Bool = false
    @State private var isSearch: Bool = false
    
    var body: some View {
        SearchNavigationView(inputText: $inputText, isSearch: $isSearch, placeholder: "게임, 앱, 스토리 등", onSubmit: { // 직접 검색
            searchAppList(text: inputText)
            trieWrapper.insert(word: inputText)
            isSearch = true
        }) {
            VStack {
                if isSearch {
                    if searchViewModel.isLoading { ProgressView() }
                    else { SearchResultView() } // 검색 결과 화면
                } else if isEditing {
                    RecentSearchMatchesView(trieWrapper: trieWrapper, inputText: $inputText, onSubmit: {
                        searchAppList(text: inputText)
                        isSearch = true
                    }) // 최근 검색 필터링
                } else {
                    RecentSearchView(trieWrapper: trieWrapper, inputText: $inputText, onSubmit: { // 최근 검색 클릭
                        searchAppList(text: inputText)
                        isSearch = true
                    })
                }
            }
            .navigationTitle("검색")
        }
        .ignoresSafeArea(edges: .top)
        .environmentObject(searchViewModel)
        .onChange(of: inputText) {
            if inputText.isEmpty {
                isEditing = false
                isSearch = false
            } else {
                isEditing = true
            }
        }
    }
}

#Preview {
    SearchView()
}

extension SearchView {
    func searchAppList(text: String) {
        searchViewModel.fetchSearchList(text: text) { result in
            switch result {
            case .success(_):
                print("Fetch successfully - Search : \(text)")
            case .failure(let error):
                print("Fetch Failed - \(error.localizedDescription)")
            }
        }
    }
}
