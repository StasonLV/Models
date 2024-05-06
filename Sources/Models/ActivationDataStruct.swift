//
//  ActivationDataStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 30.06.2022.
//

import Foundation

public struct ActivationData: Codable {
    public let code: String
    public let message: String
    public let status: Int
    
    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
        case status = "STATUS"
    }
}

