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
        self.apps = [
            Application(
                title: "카카오뱅크",
                genres: ["금융"],
                iconImageURL: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/94/d1/ed/94d1ed2d-6053-e31f-6a46-3c109cc8445c/AppIcon_real-0-0-1x_U007ephone-0-0-85-220.png/100x100bb.jpg",
                ratingScore: 3.34,
                ratingCount: 12657,
                recommenedAge: "4+",
                baseLanguage: ["KO"],
                minimumOsVersion: "13.0",                
                screenShotURLList: [
                    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6f/b8/d0/6fb8d0c0-df10-436a-949e-bf504277a1eb/6e511b0d-a668-4e02-a829-a9effd325d93_ios_5.5_01.png/392x696bb.png",
                    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/58/9d/5a/589d5a31-acca-22f8-68af-65ff722ceeca/64b06241-20db-414f-b368-05ba25a37075_ios_5.5_02.png/392x696bb.png",
                    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/f2/a9/58/f2a958d9-d4bf-3a9b-31d3-23214041c3e9/4295eb77-425e-448d-bb32-9a303d2b4d27_ios_5.5_03.png/392x696bb.png"
                ],
                supportedDevices: [
                    "iPhone6", "iPhone6Plus", "iPhone7", "iPhone8", "iPhoneX"
                ],
                longDescription: "일상에서 더 쉽게, 더 자주 만나는\n제1금융권 은행, 카카오뱅크\n\n■ 새롭게 디자인된 은행\n• 365일 언제나 지점 방문 없이 모든 은행 업무를 모바일에서\n• 7분만에 끝나는 쉬운 계좌개설\n\n■ 쉬운 사용성\n• 공동인증서, 보안카드 없는 계좌이체\n• 계좌번호를 몰라도 카톡 친구에게 간편 송금 (상대방이 카카오뱅크 고객이 아니어도 송금 가능)\n\n■ 내 취향대로 선택\n• 카카오프렌즈 캐릭터 디자인부터 고급스러운 블랙 컬러까지, 세련된 디자인의 체크카드\n• 내 마음대로 설정하는 계좌 이름과 색상\n\n■ 눈에 보이는 혜택\n• 복잡한 가입 조건이나 우대 조건 없이, 누구에게나 경쟁력있는 금리와 혜택 제공\n• 늘어나는 이자를 실시간으로 확인할 수 있는 정기예금\n• 만 19세 이상 대한민국 국민의 90%가 신청 가능한 비상금대출(소액 마이너스대출)\n\n■ 카카오프렌즈와 함께하는 26주적금\n• 천원부터 차곡차곡 26주동안 매주 쌓는 적금\n• 카카오프렌즈 응원과 함께하면 어느덧 만기 달성이 눈앞에!\n\n■ 알아서 차곡차곡 모아주는 저금통\n• 원하는 모으기 규칙 선택으로 부담없이 저축하기\n• 평소에는 귀여운 아이템으로, 엿보기 기능으로 잔액 확인\n\n■ 함께쓰고 같이보는 모임통장\n• 손쉽게 카카오톡 친구들을 멤버로 초대 \n• 잔액과 입출금 현황을 멤버들과 함께 보기 \n• 위트있는 메시지카드로 회비 요청\n\n■ 소중한 ‘내 신용정보’ 관리\n• 제1금융권에서 안전하게 무료로 내 신용정보 확인\n• 신용 변동내역 발생 시 알림 서비스 및 신용정보 관리 꿀팁 제공\n\n■ 파격적인 수수료로 해외송금\n• 365일 언제 어디서든 이용가능한 해외송금 (보내기 및 받기)\n• 해외계좌 및 웨스턴유니온(WU)을 통해 전세계 200여 개국으로 해외송금 가능\n• 거래외국환은행 지정, 연장 업무도 지점방문없이 모바일에서 신청 가능 \n\n■ 카카오뱅크에서 만나는 제휴서비스\n• 증권사 주식계좌도 간편하게 개설 가능\n• 프렌즈 캐릭터가 함께하는 제휴 신용카드 신청 가능\n\n■ 이체수수료 및 입출금 수수료 면제\n• 타행 이체 및 자동이체 수수료 면제\n• 국내 모든 ATM(은행, 제휴 VAN사 기기) 입금/출금/이체 수수료 면제\n\n* ATM/CD기 입금/출금/이체 수수료는 향후 정책에 따라 변경될 수 있습니다. 정책이 변경되는 경우 시행 1개월 전에 카카오뱅크 앱 및 홈페이지를 통해 미리 알려드립니다.\n\n■ 고객센터 운영 시간 안내\n• 예/적금, 대출, 카드 문의 : 1599-3333 (09:00 ~ 22:00 365일)\n• 전월세 보증금 대출, 외환 문의 : 1599-3333 (09:00 ~ 18:00 평일)\n• 사고 신고 : 1599-8888 (24시간 365일)\n\n■ 챗봇 운영 시간 안내\n• 카카오톡 플러스친구 \"카카오뱅크 고객센터\" (24시간 365일)\n\n■ 카카오뱅크 앱 이용을 위한 권한 및 목적 안내\n• 카메라(선택) : 신분증 촬영 및 서류 제출, 영상통화, 프로필 사진 등록\n• 사진(선택) : 이체⁄송금⁄출금 확인증, 카드매출전표 저장\n• 위치(선택) : 부정가입방지 및 부정거래탐지\n\n * 선택 접근권한은 동의하지 않아도 서비스를 이용하실 수 있습니다.",
                developerID: "KakaoBank Corp."
            )
        ]
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
            ratingCount: result.userRatingCount,
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
