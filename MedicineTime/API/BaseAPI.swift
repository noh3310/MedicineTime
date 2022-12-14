//
//  BaseAPI.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/16.
//

import Foundation
import Combine

class BaseAPI {
    
    private init() {}
    
    static let shared = BaseAPI()
    
    func getApi(_ name: String) -> AnyPublisher<[Item], Error> {

        let encodeName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlStr = "https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=\(APIKeys.serviceKey)&itemName=\(encodeName)&type=json"
        let url = URL(string: urlStr)!
        
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
    }
}
