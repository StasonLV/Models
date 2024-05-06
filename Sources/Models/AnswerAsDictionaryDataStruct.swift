//
//  AnswerAsDictionaryDataStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 30.06.2022.
//

import Foundation

public struct AnswerAsDictionaryData: Codable {
    public let message: String
    public let status: Int
    public let idAnswer: Int?
    public let rel: String?
    public let pOutValue: String?
    public let pOutMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "MESSAGE"
        case status = "STATUS"
        case idAnswer = "ID"
        case rel = "REL"
        case pOutValue = "POUTVALUE"
        case pOutMessage = "POUTMESSAGE"
    }
}

