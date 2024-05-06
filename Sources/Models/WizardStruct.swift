//
//  WizardStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 17.03.2021.
//

import Foundation

public struct WizardItem: Codable {
    let idItem: Int?                      // 01
    let idAdmModule: Int?                 // 02
    let nItem: Int?                       // 03
    let nOrder : Int?                     // 04
    let sName: String?                    // 05
    let lOpenList: Bool?                  // 06
    let menuCur:[ModuleMenuItem]?        // 07
    
    enum CodingKeys: String, CodingKey {
        
        case idItem = "ID"
        case idAdmModule = "IDADMMODULE"
        case nItem = "NITEM"
        case nOrder = "NORDER"
        case sName = "SNAME"
        case lOpenList = "LOPENLIST"
        case menuCur = "MENUCUR"
        
    }
    
    public init(from decoder: Decoder) throws {
        print("struct WizardItem : Codable public init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("WizardItem.rawValues:\(values)")
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        idAdmModule = try values.decodeIfPresent(Int.self, forKey: .idAdmModule)
        nItem = try values.decodeIfPresent(Int.self, forKey: .nItem)
        nOrder = try values.decodeIfPresent(Int.self, forKey: .nOrder)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
        lOpenList = try values.decodeIfPresent(Bool.self, forKey: .lOpenList)
        menuCur = try values.decodeIfPresent([ModuleMenuItem].self, forKey: .menuCur)
    }
}

public struct WizardData : Decodable {
    let _data : [WizardItem]?
    let _struct : [StructItem]?
    let _info : InfoObject?
    let _meta : MetaObject?
    
    enum CodingKeys: String, CodingKey {
        
        case _data = "_data"
        case _struct = "_struct"
        case _info = "_info"
        case _meta = "_meta"
    }
    
    public init(from decoder: Decoder) throws {
        print("struct ActionsData : Codable public init")
        //        print("CodingKeys.self: \(CodingKeys.self)")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        print("values: \(values)")
        _data = try values.decodeIfPresent([WizardItem].self, forKey: ._data)
        //        print("_data:\(String(describing: _data))")
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
}

typealias RawWizardData = [WizardData]
