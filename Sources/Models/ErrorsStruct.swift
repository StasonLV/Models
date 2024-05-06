//
//  ErrorsStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 08.03.2021.
//

import Foundation

public struct ServerOracleError: Codable {
    let message: String?
    let status: Int?
    let info: String?
    let reason: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "MESSAGE"
        case status = "STATUS"
        case info = "INFO"
        case reason = "REASON"
    }
    
    public init(from decoder: Decoder) throws {
        print("struct ServerOracleError : Codable public init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        info = try values.decodeIfPresent(String.self, forKey: .info)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
    }
}

public enum NetworkError: Error {
    case statusCode401
    case undefinedError(String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .statusCode401:
            return NSLocalizedString("Error 401", comment:"Common Strings")
        case .undefinedError(let message):
            return NSLocalizedString(
                "\(message)",
                comment: ""
            )
        }
    }
}
