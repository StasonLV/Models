//
//  TokensStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 08.03.2021.
//

import Foundation

public struct Tokens: Codable {
    public let expiresIn: Int?
    public let tokenType: String?
    public let refreshToken: String?
    public let accessToken: String?
    public let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case expiresIn = "EXPIRES_IN"
        case tokenType = "TOKEN_TYPE"
        case refreshToken = "REFRESH_TOKEN"
        case accessToken = "ACCESS_TOKEN"
        case id = "ID"
        
    }
}

typealias TokensData = Tokens

