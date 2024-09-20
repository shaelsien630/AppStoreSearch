# AppStoreSearch
> AppStore 검색 탭 구현

<br>

## 1. 프로젝트 소개

개발환경 : Xcode 15.4, iOS 17<br>
사용 API : [앱스토어 검색 API](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html#//apple_ref/doc/uid/TP40017632-CH3-SW1/ "앱스토어")<br>
채택한 아키텍쳐: MVVM Architecture<br>
기술 스택 : RxSwift, SwiftUI<br>

<br>

## 2. 필수 기능

● 검색 화면<br>
&nbsp; &nbsp; ○ 검색어 입력 전<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 최근 검색어 목록<br>
&nbsp; &nbsp; ○ 검색어 입력 중<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 최근 검색어 일치 항목 리스트 표시<br>
&nbsp; &nbsp; ○ 검색어 입력 후 결과 화면<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 앱 아이콘<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 타이틀<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 별점 (숫자를 포함하는 별모양 표시)<br>
&nbsp; &nbsp; &nbsp; &nbsp; ■ 스크린샷<br>
<br>
● 상세 화면<br>
&nbsp; &nbsp; ○ 앱 아이콘<br>
&nbsp; &nbsp; ○ 타이틀<br>
&nbsp; &nbsp; ○ 스크린샷<br>
&nbsp; &nbsp; ○ ‘더보기’ 기능을 포함하는 앱 설명 혹은 새로운 기능<br>

<br>

## 3. 실행 화면

![](https://github.com/user-attachments/assets/6a84a38b-4e86-40cc-b9c5-f8dfcf522055)

