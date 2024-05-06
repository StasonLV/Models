//
//  FileStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 12.04.2021.
//

import Foundation

public struct FileData: Codable {
    
    let fileData: Data?
    
    enum CodingKeys: String, CodingKey {
        case fileData = "FILEDATA"
        
    }
}
