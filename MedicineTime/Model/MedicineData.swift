//
//  MedicineData.swift
//  MedicineTime
//
//  Created by 노건호 on 2023/01/01.
//

import Foundation
import RealmSwift

class MedicineData: Object, ObjectKeyIdentifiable, Comparable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var date: Date
    
    static func < (lhs: MedicineData, rhs: MedicineData) -> Bool {
        if lhs.date <= rhs.date {
            return true
        } else {
            return false
        }
    }
}
