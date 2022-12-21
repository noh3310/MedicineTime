//
//  Medicine.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/21.
//

import Foundation

// MARK: - Medicine
struct Medicine: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let pageNo, totalCount, numOfRows: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let entpName, itemName, itemSeq, efcyQesitm: String
    let useMethodQesitm: String
    let atpnWarnQesitm: String?
    let atpnQesitm, intrcQesitm, seQesitm, depositMethodQesitm: String
    let openDe, updateDe: String
    let itemImage: String
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}
