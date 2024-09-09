//
//  SearchModel.swift
//  AppStoreSearch
//
//  Created by 최서희 on 8/29/24.
//

import Foundation

struct Application: Identifiable {
    let id: String = UUID().uuidString
    let title: String                   // 타이틀 : trackName
    let genres: [String]                // 설명 : genres
    let iconImageURL: String            // 아이콘 : artworkUrl100
    let ratingScore: Double             // 별점 : averageUserRating
    let ratingCount: Int                // 다운로드 횟수 : userRatingCount
    let recommenedAge: String           // 권장 나이 : contentAdvisoryRating
    let baseLanguage: [String]          // 언어 : languageCodesISO2A
    let minimumOsVersion: String        // 최소지원 버전 : minimumOsVersion
    let screenShotURLList: [String]     // 스크린샷 콜렉션뷰 이미지 URL : screenshotUrls
    let supportedDevices: [String]      // 기기정보 : supportedDevices
    let longDescription: String         // 상세정보 : description
    let developerID: String             // 개발자 : sellerName
}

struct SearchResult: Codable {
    let resultCount: Int
    let results: [ResultItem]
}

struct ResultItem: Codable {
    let screenshotUrls, ipadScreenshotUrls: [String]
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let artistViewUrl: String
    let features: [String]
    let supportedDevices, advisories: [String]
    let isGameCenterEnabled: Bool
    let kind: String
    let minimumOsVersion, trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerUrl: String?
    let formattedPrice: String?
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewUrl: String
    let trackContentRating: String
    let bundleId: String
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    let genreIds: [String]
    let isVppDeviceBasedLicensingEnabled: Bool
    let sellerName: String
    let releaseNotes: String?
    let primaryGenreId: Int
    let currency: String
    let version: String
    let wrapperType: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double?
    let description: String
    let userRatingCount: Int
}
