//
//  PrnSqlStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 19.03.2021.
//

import Foundation

struct PrnSqlItem: Codable {
    let idItem: Int?
    let sName: String?
    
    enum CodingKeys: String, CodingKey {
        case idItem = "ID"
        case sName = "SNAME"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct OneToManyItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("OneToManyItem.rawValues:\(values)")
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
    }
}

/*
 "SNAME": "Список задач пустой",
 "ID": 1581
 */
