//
//  HomeVIewModel.swift
//  MedicineTime
//
//  Created by 노건호 on 2023/01/01.
//

import Foundation
import Combine
import RealmSwift

class HomeViewModel: ObservableObject {
    
    private let realm = try! Realm()
    var medicines: Results<MedicineData>!
    
    @Published var medicineData = ""
    
    init() {
        print("Realm is located at:", realm.configuration.fileURL!)
        
        medicines = realm.objects(MedicineData.self)
    }
    
    func addDate(medicineName name: String, date: Date) {
        let newData = MedicineData()
        newData.name = name
        newData.date = date
        
        do {
            try realm.write {
                realm.add(newData)
            }
        } catch let error as NSError {
            print(error)
        }
    }
}
