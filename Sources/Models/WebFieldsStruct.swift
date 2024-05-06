//
//  WebFieldsStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 23.03.2021.
//

import Foundation

public struct WebFieldItem: Codable {
    let nPage:Int?                       //  01
    let idAdmModule:Int?                 //  02
    let id:Int?                          //  03
    var sName:String?                    //  04
    let sType:String?                    //  05
    let sCaption:String?                 //  06
    let lShowCaption:Bool?               //  07
    var lVisible:Bool?                   //  08
    let lReadOnly:Bool?                  //  09
    let lRequired:Bool?                  //  10
    let nOrder:Int?                      //  11
    let idControl:Int?                   //  12
    let nItemDic:Int?                    //  13
    var sConnectField:String?            //  14
    let lDic:Bool?                       //  15
    let nullable:Bool?                   //  16
    
    enum CodingKeys: String, CodingKey {
        
        case nPage = "NPAGE"
        case idAdmModule = "IDADMMODULE"
        case id = "ID"
        case sName = "SNAME"
        case sType = "STYPE"
        case sCaption = "SCAPTION"
        case lShowCaption = "LSHOWCAPTION"
        case lVisible = "LVISIBLE"
        case lReadOnly = "LREADONLY"
        case lRequired = "LREQUIRED"
        case nOrder = "NORDER"
        case idControl = "IDCONTROL"
        case nItemDic = "NITEMDIC"
        case sConnectField = "SCONNECTFIELD"
        case lDic = "LDIC"
        case nullable = "NULLABLE"
    }
    
    public init(from decoder: Decoder) throws {
//        print("struct ActionItem : Codable public init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("ActionItem.rawValues:\(values)")
        nPage = try values.decodeIfPresent(Int.self, forKey: .nPage)
        idAdmModule = try values.decodeIfPresent(Int.self, forKey: .idAdmModule)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
        sType = try values.decodeIfPresent(String.self, forKey: .sType)
        sCaption = try values.decodeIfPresent(String.self, forKey: .sCaption)
        lShowCaption = try values.decodeIfPresent(Bool.self, forKey: .lShowCaption)
        lVisible = try values.decodeIfPresent(Bool.self, forKey: .lVisible)
        lReadOnly = try values.decodeIfPresent(Bool.self, forKey: .lReadOnly)
        lRequired = try values.decodeIfPresent(Bool.self, forKey: .lRequired)
        nOrder = try values.decodeIfPresent(Int.self, forKey: .nOrder)
        idControl = try values.decodeIfPresent(Int.self, forKey: .idControl)
        nItemDic = try values.decodeIfPresent(Int.self, forKey: .nItemDic)
        sConnectField = try values.decodeIfPresent(String.self, forKey: .sConnectField)
        lDic = try values.decodeIfPresent(Bool.self, forKey: .lDic)
        nullable = try values.decodeIfPresent(Bool.self, forKey: .nullable)
    }
}

public struct WebFieldsData : Decodable {
    let _data : [WebFieldItem]?
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
        print("struct WebFieldsData : Codable public init")
        print("CodingKeys.self: \(CodingKeys.self)")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("values: \(values)")
        _data = try values.decodeIfPresent([WebFieldItem].self, forKey: ._data)
        print("_data:\(String(describing: _data))")
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
}

typealias RawWebFieldsData = [WebFieldsData]
