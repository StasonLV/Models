//
//  ModulesStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 17.03.2021.
//

import Foundation

struct ModuleItem : Codable {
    let sName : String?
    let idItem : Int?
    let sLogo : String?
    let nColorScheme : Int?
    let sColor : String?
    var sIconName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case sName = "SNAME"
        case idItem = "ID"
        case sLogo = "SLOGO"
        case nColorScheme = "NCOLORSCHEME"
        case sColor = "SCOLOR"
        case sIconName = "SICONNAME"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct ModuleItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        sLogo = try values.decodeIfPresent(String.self, forKey: .sLogo)
        nColorScheme = try values.decodeIfPresent(Int.self, forKey: .nColorScheme)
        sColor = try values.decodeIfPresent(String.self, forKey: .sColor)
        sIconName = try values.decodeIfPresent(String.self, forKey: .sIconName)
        
        let arrayIconName = sIconName?.split(separator: " ")
        if arrayIconName?.count == 2
        {
            sIconName = String(arrayIconName?[1] ?? "")
        }
    }
    
    public init(sName:String, sColor:String, idItem:Int, sLogo:String, nColorScheme:Int, sIconName:String) {
        self.sName = sName
        self.sColor = sColor
        self.idItem = idItem
        self.sLogo = sLogo
        self.nColorScheme = nColorScheme
        self.sIconName = sIconName
    }
    
    static func == (left: ModuleItem, right:ModuleItem) -> Bool {
        return left.idItem == right.idItem
    }
}

struct ModulesData : Decodable {
    let _data : [ModuleItem]?
    let _struct : [StructItem]?
    let _info : InfoObject?
    let _meta : MetaObject?
    
    enum CodingKeys: String, CodingKey {
        
        case _data = "_data"
        case _struct = "_struct"
        case _info = "_info"
        case _meta = "_meta"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct BaseData : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _data = try values.decodeIfPresent([ModuleItem].self, forKey: ._data)
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
    
}

typealias RawModulesData = [ModulesData]

