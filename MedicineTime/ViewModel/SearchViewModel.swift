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
    
    @Published var selectedMedicine: Item?
    @Published var medicineTime = Date()
    
    @Published var searchMedicineData: [Item] = []
    
    @Published var searchText = ""
    
    init() {
        $searchText
            .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
            .filter { $0 != "" }
            .flatMap { BaseAPI.shared.getApi($0) }
            .sink { result in
                print(result)
            } receiveValue: { items in
                DispatchQueue.main.async {
                    self.searchMedicineData = items
                }
            }
            .store(in: &cancellables)
    }
}
