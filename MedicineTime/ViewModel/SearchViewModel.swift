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
    
    @Published var selectedMedicine: Item? {
        didSet {
            self.searchText = selectedMedicine?.itemName ?? ""
        }
    }
    
    @Published var searchMedicineData: [Item] = []
    
    @Published var searchText = "" {
        didSet {
            print("didSet")
            BaseAPI.shared.getApi(self.searchText)
                .sink { result in
                    print(result)
                } receiveValue: { items in
                    print("items = \(items)")
                    DispatchQueue.main.async {
                        self.searchMedicineData = items                        
                    }
                }
                .store(in: &cancellables)
        }
    }
}
