//
//  AddMedicineViewModel.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/27.
//

import Foundation
import Combine

struct MedicineData: Identifiable {
    var id = UUID()
    var date: Date
}

class AddMedicineViewModel: ObservableObject {
    
    static let shared = AddMedicineViewModel()
    
    @Published var medicineData: Item?
    
    @Published var medicineTimes: [MedicineData] = [] {
        willSet {
            print("willSet = \(self.medicineTimes.count)")
            objectWillChange.send()
        }
        didSet {
            print("didSet = \(self.medicineTimes.count)")
        }
    }
}
