//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @StateObject var trieWrapper = TrieWrapper(words: ["버스 시간표", "포토샵", "쇼핑", "지하철", "카카오뱅크"])
    @State private var inputText: String = ""
    @State private var isEditing: Bool = false
    @State private var isSearch: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        SearchNavigationView(inputText: $inputText, isSearch: $isSearch, placeholder: "게임, 앱, 스토리 등", onSubmit: { // 직접 검색
            searchAppList(text: inputText)
            trieWrapper.insert(word: inputText)
            isSearch = true
        }) {
            VStack {
                if isSearch {
                    if isLoading { ProgressView() }
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
        .onAppear {
            searchViewModel.isLoading
                .bind { isLoading in
                    self.isLoading = isLoading
                }
                .disposed(by: searchViewModel.disposeBag)
        }
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
        searchViewModel.fetchSearchList(text: text)
            .subscribe(
                onNext: {
                    print("Fetch successfully - Search: \(text)")
                },
                onError: { error in
                    print("Fetch failed - \(error.localizedDescription)")
                }
            )
            .disposed(by: searchViewModel.disposeBag)
    }
}
