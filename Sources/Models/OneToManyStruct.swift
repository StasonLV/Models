//
//  OneToManyStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 18.03.2021.
//

import Foundation

/*
 
 "STABLENAME": "Med.DvpResult",
 "ID": 6382,
 "SCOMMENT": "Выполненные задачи"
 
 */

struct OneToManyItem: Codable {
    let idItem: Int?            // 1
    let stableName: String?     // 2
    let sComment: String?       // 3
    
    enum CodingKeys: String, CodingKey {
        
        case idItem = "ID"
        case stableName = "STABLENAME"
        case sComment = "SCOMMENT"
        
    }
    
    init(from decoder: Decoder) throws {
//        print("struct OneToManyItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("OneToManyItem.rawValues:\(values)")
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        stableName = try values.decodeIfPresent(String.self, forKey: .stableName)
        sComment = try values.decodeIfPresent(String.self, forKey: .sComment)
    }
}
