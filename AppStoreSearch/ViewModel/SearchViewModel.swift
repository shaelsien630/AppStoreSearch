//
//  SearchViewModel.swift
//  AppStoreSearch
//
//  Created by 최서희 on 8/29/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var apps: [Application] = []
    
    init() {
        self.apps = [Application(title: "Sample App", genres: ["Utilities"], iconImageURL: "", ratingScore: 4.5, downloadCount: 100, recommenedAge: "4+", baseLanguage: ["EN"], minimumOsVersion: "13.0", screenShotURLList: [], supportedDevices: ["iPhone"], longDescription: "This is a sample app description.", developerID: "Sample Developer")]
    }
    
    func fetchSearchList(text: String, completion: @escaping (Result<Void, Error>) -> Void) {
        isLoading = true
        let urlString = "https://itunes.apple.com/search?entity=software&term=" + text + "&country=kr"
        if let url = URL(string: urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    let statusCodeError = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey : "Status code: \(httpResponse.statusCode)"])
                    completion(.failure(statusCodeError))
                    return
                }
                
                if let dataReceived = data {
                    do {
                        let decodedList = try JSONDecoder().decode(SearchResult.self, from: dataReceived)
                        self.apps = decodedList.results.map { self.convert(result: $0) }
                        self.isLoading = false // TO-DO :: 실패했을때, count가 0일때 UI 추가하기 - 검색 결과가 없습니다.
                        completion(.success(()))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                }
            }
            dataTask.resume()
        }
    }
    
    func convert(result: ResultItem) -> Application {
        return Application(
            title: result.trackName,
            genres: result.genres,
            iconImageURL: result.artworkUrl100,
            ratingScore: result.averageUserRating,
            downloadCount: result.userRatingCount,
            recommenedAge: result.contentAdvisoryRating,
            baseLanguage: result.languageCodesISO2A,
            minimumOsVersion: result.minimumOsVersion,
            screenShotURLList: result.screenshotUrls,
            supportedDevices: result.supportedDevices,
            longDescription: result.description,
            developerID: result.sellerName
        )
    }
}
