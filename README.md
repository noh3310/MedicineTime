# MedicineTime

## 기능

- 복용중인 약 추가
  - API 사용해 검색기능 구현
- 약 먹기
  - 복용시간 선택

## Spec

- 최소버전: ios 14.0
- SwiftUI
- Combine
- URLSession

## 기능 상세

- SwiftUI 이용해 UI 구현
- URLSession.dataTaskPublisher 사용해 API 호출
- Realm 이용해 복용기록 데이터베이스에 저장

## 고민했던 점

- NavigationLink로 화면전환을 수행했을 때 TabBar가 사라지지 않는 문제
  - TabBar화면 내 NavigationView가 있었기 때문에 화면 전환이 되더라도 TabBar가 사라지지 않았다
    - NavigationView 내 TabView를 만들어 NavigationLink를 통해 화면전환을 수행할 때 TabBar 사라지도록 구현
- Combine을 사용해 API 결과값을 **AnyPublisher**로 리턴하는 방법
  - URLSession.dataTaskPublisher를 사용해 AnyPublisher<[Item], Error> 리턴하는 함수 구현
    ```Swift
    return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: Medicine.self, decoder: JSONDecoder())
            .map { $0.body?.items ?? [] }
            .eraseToAnyPublisher()
    ```
