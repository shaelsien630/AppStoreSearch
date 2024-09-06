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
        // ■ 앱 아이콘
        // ■ 타이틀
        // ■ 별점 (숫자를 포함하는 별모양 표시)
        // ■ 스크린샷
        Text(searchViewModel.apps[index].title)
    }
}

#Preview {
    return SearchResultRowView(index: 0)
        .environmentObject(SearchViewModel())
}
