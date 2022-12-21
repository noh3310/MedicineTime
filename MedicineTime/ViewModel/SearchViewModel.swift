//
//  SearchViewModel.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/16.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var searchText = "" {
        didSet {
            print("didSet")
            BaseAPI.shared.getApi()
                .sink { result in
                    print(result)
                } receiveValue: { items in
                    print("items = \(items)")
                }
                .store(in: &cancellables)
            
            BaseAPI.shared.getDataTask()
        }
    }
}
