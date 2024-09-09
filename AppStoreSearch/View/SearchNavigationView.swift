//
//  SearchNavigationView.swift
//  AppStoreSearch
//
//  Created by 최서희 on 9/5/24.
//

import SwiftUI
import UIKit

struct SearchNavigationView<Content: View>: UIViewControllerRepresentable {
    @Binding var inputText: String
    @Binding var isSearch: Bool
    let placeholder: String
    var onSubmit: () -> Void
    var content: () -> Content

    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: context.coordinator.rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        let searchController = context.coordinator.searchController
        searchController.searchBar.text = inputText
        searchController.isActive = true
        context.coordinator.rootViewController.rootView = content()
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(inputText: $inputText, isSearch: $isSearch, placeholder: placeholder, onSubmit: onSubmit, content: content)
    }

    class Coordinator: NSObject, UISearchResultsUpdating, UISearchBarDelegate {
        @Binding var inputText: String
        @Binding var isSearch: Bool
        let searchController: UISearchController
        let rootViewController: UIHostingController<Content>
        let placeholder: String
        var onSubmit: () -> Void

        init(inputText: Binding<String>, isSearch: Binding<Bool>, placeholder: String, onSubmit: @escaping () -> Void, content: @escaping () -> Content) {
            _inputText = inputText
            _isSearch = isSearch
            self.placeholder = placeholder
            self.onSubmit = onSubmit
            searchController = UISearchController(searchResultsController: nil)
            rootViewController = UIHostingController(rootView: content())
            super.init()

            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.delegate = self
            searchController.searchBar.placeholder = placeholder
            rootViewController.navigationItem.searchController = searchController
            rootViewController.navigationItem.hidesSearchBarWhenScrolling = false
        }

        func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
                inputText = searchText
            }
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            isSearch = false
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            onSubmit()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        }
    }
}
