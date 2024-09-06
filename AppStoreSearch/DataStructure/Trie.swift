//
//  Trie.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/3/24.
//

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private let root = TrieNode()
    
    // 삽입 메서드
    func insert(word: String) {
        var currentNode = root
        for char in word {
            if currentNode.children[char] == nil {
                currentNode.children[char] = TrieNode()
            }
            currentNode = currentNode.children[char]!
        }
        currentNode.isEndOfWord = true
    }
    
    // 검색 메서드
    func search(prefix: String) -> [String] {
        var currentNode = root
        for char in prefix {
            guard let nextNode = currentNode.children[char] else {
                return [] // prefix에 해당하는 결과가 없음
            }
            currentNode = nextNode
        }
        return findAllWords(from: currentNode, prefix: prefix)
    }

    // Trie에 있는 모든 단어를 가져오는 메서드
    func getAllWords() -> [String] {
        return findAllWords(from: root, prefix: "")
    }
    
    // 모든 단어를 찾는 재귀 메서드
    private func findAllWords(from node: TrieNode, prefix: String) -> [String] {
        var words: [String] = []
        
        if node.isEndOfWord {
            words.append(prefix)
        }
        
        for (char, childNode) in node.children {
            words += findAllWords(from: childNode, prefix: prefix + String(char))
        }
        
        return words
    }
}
