//
//  ModuleMenuDataStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 29.03.2021.
//

import Foundation

extension ModuleMenuData {
    public enum GenericValue: Codable {
        case stringValue(String)
        case intValue(Int)
        case boolValue(Bool)
        case doubleValue(Double)
        case unknown
    }
}

extension ModuleMenuData.GenericValue {
    
    var value: String {
        switch self {
        case .stringValue(let stringValue): return stringValue
        case .intValue(let intValue): return "\(intValue)"
        case .boolValue(let boolValue): return "\(boolValue)"
        case .doubleValue(let doubleValue): return "\(doubleValue)"
        case .unknown: return ""
        }
    }
}

extension ModuleMenuData.GenericValue {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let stringValue = try? container.decode(String.self) {
            self = .stringValue(stringValue)
        } else if let intValue = try? container.decode(Int.self) {
            self = .intValue(intValue)
        } else if let boolValue = try? container.decode(Bool.self) {
            self = .boolValue(boolValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            self = .doubleValue(doubleValue)
        } else {
            assertionFailure("Unknown  type")
            self = .unknown
        }
    }
    
    public init(value:String) {
        self = .stringValue(value)
    }
}

extension ModuleMenuData.GenericValue {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .stringValue(let stringValue): try container.encode(stringValue)
        case .intValue(let intValue): try container.encode(intValue)
        case .boolValue(let boolValue): try container.encode(boolValue)
        case .doubleValue(let doubleValue): try container.encode(doubleValue)
        case .unknown: throw NSError(domain: "Unknown case is not encodable", code: -1, userInfo: nil)
        }
    }
}

struct ModuleMenuData : Decodable {
    var _data : [[String:GenericValue]]?
    let _struct : [StructItem]?
    let _info : InfoObject?
    let _meta : MetaObject?
    
    enum CodingKeys: String, CodingKey {
        
        case _data = "_data"
        case _struct = "_struct"
        case _info = "_info"
        case _meta = "_meta"
    }
    
    public init (_data:[[String:GenericValue]]?, _struct:[StructItem]?, _info:InfoObject?, _meta:MetaObject?
                 
    ){
        self._data = _data
        self._struct = _struct
        self._info = _info
        self._meta = _meta
    }
    
    init(from decoder: Decoder) throws {
//        print("struct ModuleMenuDataObject : Decoder init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _data = try values.decodeIfPresent([[String:GenericValue]].self, forKey: ._data)
        //        print("_data:\(String(describing: _data))")
//        for row in _data ?? [] {
//            for key in row.keys {
//                print("data row[\(key)]:\(row[key]?.value ?? "")")
//            }
//        }
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
//        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
}

typealias RawModuleMenuDataObject = [ModuleMenuData]
