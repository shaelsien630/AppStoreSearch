//
//  TrieWrapper.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import Foundation

class TrieWrapper: ObservableObject {
    private let trie = Trie() // Trie 인스턴스 생성
    
    init(words: [String] = []) {
        for word in words {
            trie.insert(word: word)
        }
    }
    
    func insert(word: String) {
        trie.insert(word: word)
    }
    
    func search(prefix: String) -> [String] {
        return trie.search(prefix: prefix)
    }
    
    func getAllWords() -> [String] {
        return trie.getAllWords()
    }
}
