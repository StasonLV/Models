//
//  BaseStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 10.03.2021.
//

import Foundation
import SwiftUI

public struct ScreenContainer {
    var idModule : Int?
    var idItem : Int?
    var idData : Int?
    var moduleMenu : ModuleMenu?
    var moduleMenuData : ModuleMenuData?
}

struct FieldItem : Decodable {
    let oraPrecision : Int?         // 01
    let oraScale : Int?             // 02
    let field : String?             // 03
    let required : Bool?            // 04
    let nullable : Bool?            // 05
    let maxLength : Int?            // 06
    let precision : Int?            // 07
    let visible : Bool?             // 08
    let order : Int?                // 09
    let averageLength : Int?        // 10
    let typeColumn : String?        // 11
    let type : String?              // 12
    let readonly : Bool?            // 13
    let requiredOne : Bool?         // 14
    let width : Int?                // 15
    let caption : String?           // 16
    let lManyValues : Bool?         // 17
    let signed : Bool?              // 18
    
    enum CodingKeys: String, CodingKey {
        
        case oraPrecision = "ORA_PRECISION"
        case oraScale = "ORA_SCALE"
        case field = "FIELD"
        case required = "REQUIRED"
        case nullable = "NULLABLE"
        case maxLength = "MAX_LENGTH"
        case precision = "PRECISION"
        case visible = "VISIBLE"
        case order = "ORDER"
        case averageLength = "AVERAGE_LENGTH"
        case typeColumn = "TYPE_COLUMN"
        case type = "TYPE"
        case readonly = "READONLY"
        case requiredOne = "REQUIREDONE"
        case width = "WIDTH"
        case caption = "CAPTION"
        case lManyValues = "LMANYVALUES"
        case signed = "SIGNED"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct FieldItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("FieldItem rawValues:\(values)")
        oraPrecision = try values.decodeIfPresent(Int.self, forKey: .oraPrecision)
        oraScale = try values.decodeIfPresent(Int.self, forKey: .oraScale)
        field = try values.decodeIfPresent(String.self, forKey: .field)
        required = try values.decodeIfPresent(Bool.self, forKey: .required)
        nullable = try values.decodeIfPresent(Bool.self, forKey: .nullable)
        maxLength = try values.decodeIfPresent(Int.self, forKey: .maxLength)
        precision = try values.decodeIfPresent(Int.self, forKey: .precision)
        visible = try values.decodeIfPresent(Bool.self, forKey: .visible)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        averageLength = try values.decodeIfPresent(Int.self, forKey: .averageLength)
        typeColumn = try values.decodeIfPresent(String.self, forKey: .typeColumn)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        readonly = try values.decodeIfPresent(Bool.self, forKey: .readonly)
        requiredOne = try values.decodeIfPresent(Bool.self, forKey: .requiredOne)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        lManyValues = try values.decodeIfPresent(Bool.self, forKey: .lManyValues)
        signed = try values.decodeIfPresent(Bool.self, forKey: .signed)
    }
    
}

struct StructItem : Decodable, Identifiable {
    var id: Int {
        return order ?? 0
    }
    
    let fields : [FieldItem]?       // 01
    let oraPrecision : Int?         // 02
    let oraScale : Int?             // 03
    let field : String?             // 04
    let required : Bool?            // 05
    let nullable : Bool?            // 06
    let maxLength : Int?            // 07
    let precision : Int?            // 08
    let visible : Bool?             // 09
    let order : Int?                // 10
    let averageLength : Int?        // 11
    let typeColumn : String?        // 12
    let type : String?              // 13
    let readonly : Bool?            // 14
    let requiredOne : Bool?         // 15
    let width : Int?                // 16
    let caption : String?           // 17
    let lManyValues : Bool?         // 18
    let signed : Bool?              // 19
    let scale : Int?                // 20
    let nTextColor : Int?           // 21
    
    enum CodingKeys: String, CodingKey {
        
        case fields = "FIELDS"
        case oraPrecision = "ORA_PRECISION"
        case oraScale = "ORA_SCALE"
        case field = "FIELD"
        case required = "REQUIRED"
        case nullable = "NULLABLE"
        case maxLength = "MAX_LENGTH"
        case precision = "PRECISION"
        case visible = "VISIBLE"
        case order = "ORDER"
        case averageLength = "AVERAGE_LENGTH"
        case typeColumn = "TYPE_COLUMN"
        case type = "TYPE"
        case readonly = "READONLY"
        case requiredOne = "REQUIREDONE"
        case width = "WIDTH"
        case caption = "CAPTION"
        case lManyValues = "LMANYVALUES"
        case signed = "SIGNED"
        case scale = "SCALE"
        case nTextColor = "NTEXTCOLOR"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct _structItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        print("_structItem rawValues:\(values)")
        fields = try values.decodeIfPresent([FieldItem].self, forKey: .fields)
        //        print("fields:\(String(describing: fields))")
        oraPrecision = try values.decodeIfPresent(Int.self, forKey: .oraPrecision)
        oraScale = try values.decodeIfPresent(Int.self, forKey: .oraScale)
        field = try values.decodeIfPresent(String.self, forKey: .field)
        required = try values.decodeIfPresent(Bool.self, forKey: .required)
        nullable = try values.decodeIfPresent(Bool.self, forKey: .nullable)
        maxLength = try values.decodeIfPresent(Int.self, forKey: .maxLength)
        precision = try values.decodeIfPresent(Int.self, forKey: .precision)
        visible = try values.decodeIfPresent(Bool.self, forKey: .visible)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        averageLength = try values.decodeIfPresent(Int.self, forKey: .averageLength)
        typeColumn = try values.decodeIfPresent(String.self, forKey: .typeColumn)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        readonly = try values.decodeIfPresent(Bool.self, forKey: .readonly)
        requiredOne = try values.decodeIfPresent(Bool.self, forKey: .requiredOne)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        lManyValues = try values.decodeIfPresent(Bool.self, forKey: .lManyValues)
        signed = try values.decodeIfPresent(Bool.self, forKey: .signed)
        scale = try values.decodeIfPresent(Int.self, forKey: .scale)
        nTextColor = try values.decodeIfPresent(Int.self, forKey: .nTextColor)
    }
    
}

struct InfoObject : Decodable {
    
    let message : String?
    let status : String?
    let idItem : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case message = "MESSAGE"
        case status = "STATUS"
        case idItem = "ID"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct _infoObject : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        idItem = try values.decodeIfPresent([String].self, forKey: .idItem)
    }
    
}

struct MetaObject : Decodable {
    
    // Данные
    
    let sNewRecord: [String: String]        // 00
    let sReadOnly: [String: Bool]           // 01
    let sDisable: [String: Bool]            // 02
    let sVisible: [String: Bool]            // 03
    let sCardCaption: String                         // 04
    let sMask: String                                // 05
    let sReadOnlyFields: Set<String>                 // 06
    let sHideListFields: Set<String>                 // 07
    let sCellTemplate: String                        // 08
    let sLayoutTemplate: String                      // 09
    let sPages: Set<Int>                             // 10
    
    // Ссылочные поля
    
    let sKeyField: String                            // 11
    let sNameField: String                           // 12
    let lLoadAll: Bool                               // 13
    
    // Описание карточки данных и списка
    
    let descriptionCard: [String: Any]// 14
    let descriptionList: [String: Any]// 15
    let jsonWebFields: [[String:Any]]           // 16
    let sPageCaption: [String]                  // 17
    
    // Имя связанного поля для списков внутри Wizard
    
    let sCodeField: String                           // 18
    
    // Списки и таблицы: перечень суммируемых полей
    
    let sSumField: [String]                     // 19
    
    enum CodingKeys: String, CodingKey {
        
        // Данные
        
        case sNewRecord = "SNEWRECORD"              // 00
        case sReadOnly = "SREADONLY"                // 01
        case sDisable = "SDISABLE"                  // 02
        case sVisible = "SVISABLE"                  // 03
        case sCardCaption = "SCARDCAPTION"          // 04
        case sMask = "SMASK"                        // 05
        case sReadOnlyFields = "SREADONLYFIELDS"    // 06
        case sHideListFields = "SHIDELISTFIELDS"    // 07
        case sCellTemplate = "SCELLTEMPLATE"        // 08
        case sLayoutTemplate = "SLAYOUTTEMPLATE"    // 09
        case sPages = "SPAGES"                      // 10
        
        // Ссылочные поля
        
        case sKeyField = "SKEYFIELD"                // 11
        case sNameField = "SNAMEFIELD"              // 12
        case lLoadAll = "LLOADALL"                  // 13
        
        // Описание карточки данных и списка
        
        case descriptionCard = "DESCRIPTIONCARD"    // 14
        case descriptionList = "DESCRIPTIONLIST"    // 15
        case jsonWebFields = "JSONWEBFIELDS"        // 16
        case sPageCaption = "SPAGECAPTION"          // 17
        
        // Имя связанного поля для списков внутри Wizard
        
        case sCodeField = "SCODEFIELD"              // 18
        
        // Списки и таблицы: перечень суммируемых полей
        
        case sSumField = "SSUMFIELD"                // 19
    }
    
    init(from decoder: Decoder) throws {
//        print("struct _metaObject : Codable init")
//        print("CodingKeys.self: \(CodingKeys.self)")
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("values: \(values)")
        
        // Данные
        
        sNewRecord = stringDic(string: try values.decodeIfPresent(String.self, forKey: .sNewRecord) ?? "")              // 00
//        print("sNewRecord:\(sNewRecord)")
        sReadOnly = boolDic(string: try values.decodeIfPresent(String.self, forKey: .sReadOnly) ?? "")                  // 01
//        print("sReadOnly:\(sReadOnly)")
        sDisable = boolDic(string: try values.decodeIfPresent(String.self, forKey: .sDisable) ?? "")                    // 02
//        print("sDisable:\(sDisable)")
        sVisible = boolDic(string: try values.decodeIfPresent(String.self, forKey: .sVisible) ?? "")                    // 03
//        print("sVisible:\(sVisible)")
        sCardCaption = try values.decodeIfPresent(String.self, forKey: .sCardCaption) ?? ""                             // 04
//        print("sCardCaption:\(sCardCaption)")
        sMask = try values.decodeIfPresent(String.self, forKey: .sMask) ?? ""                                           // 05
//        print("sMask:\(sMask)")
        sReadOnlyFields = stringSet(string: try values.decodeIfPresent(String.self, forKey: .sReadOnlyFields) ?? "")    // 06
//        print("sReadOnlyFields:\(sReadOnlyFields)")
        sHideListFields = stringSet(string: try values.decodeIfPresent(String.self, forKey: .sHideListFields) ?? "")    // 07
//        print("sHideListFields:\(sHideListFields)")
        sCellTemplate = try values.decodeIfPresent(String.self, forKey: .sCellTemplate) ?? ""                           // 08
//        print("sCellTemplate:\(sCellTemplate)")
        sLayoutTemplate = try values.decodeIfPresent(String.self, forKey: .sLayoutTemplate) ?? ""                       // 09
//        print("sLayoutTemplate:\(sLayoutTemplate)")
        sPages =  intSet(string: try values.decodeIfPresent(String.self, forKey: .sPages) ?? "")                        // 10
//        print("sPages:\(sPages)")
        // Ссылочные поля
        
        sKeyField = try values.decodeIfPresent(String.self, forKey: .sKeyField) ?? ""                                   // 11
//        print("sKeyField:\(sKeyField)")
        sNameField = try values.decodeIfPresent(String.self, forKey: .sNameField) ?? ""                                 // 12
//        print("sNameField:\(sNameField)")
        lLoadAll = try values.decodeIfPresent(Bool.self, forKey: .lLoadAll) ?? false                                    // 13
//        print("lLoadAll:\(lLoadAll)")
        
        // Описание карточки данных и списка
        
        descriptionCard = try values.decodeIfPresent([String:Any].self, forKey: .descriptionCard) ?? [:]                               // 14
//        print("descriptionCard:\(descriptionCard)")
        descriptionList = try values.decodeIfPresent([String:Any].self, forKey: .descriptionList) ?? [:]                                // 15
//        print("descriptionList:\(descriptionList)")
        
        let json = try values.decodeIfPresent(Array<Any>.self, forKey: .jsonWebFields)
//        print("json:\(String(describing: json))")
        jsonWebFields = json as? [[String:Any]] != nil ? (json as? [[String:Any]]) ?? [[String:Any]]() : [[String:Any]]()      // 16
//        print("jsonWebFields:\(jsonWebFields)")
        
        sPageCaption = try values.decodeIfPresent([String].self, forKey: .sPageCaption) ?? []                           // 17
//        print("sPageCaption:\(sPageCaption)")
        
        // Имя связанного поля для списков внутри Wizard
        
        sCodeField = try values.decodeIfPresent(String.self, forKey: .sCodeField) ?? ""                                 // 18
//        print("sCodeField:\(sCodeField)")
        
        // Списки и таблицы: перечень суммируемых полей
        
        sSumField = (try values.decodeIfPresent(String.self, forKey: .sSumField) ?? "").uppercased().split(";")         // 19
//        print("sSumField:\(sSumField)")
        
    }
}

func boolDic(string:String) -> [String: Bool] {
    var dic = [String: Bool]()
    let arrayKeyValue = string.split("\r")
    
    for value in arrayKeyValue {
        let key = (value.split("="))[0].trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
        dic[key.uppercased()] = (value.split("="))[1].trimmingCharacters(in: CharacterSet.init(charactersIn: " ")).elementsEqual("Y") ? true : false
    }
    return dic
}

func stringDic(string:String) -> [String: String] {
    var dic = [String: String]()
    let arrayKeyValue = string.split("\r")
    // print("string: '\(string)'")
    for value in arrayKeyValue {
        // print("value: '\(value)'")
        let key = ((value.split("="))[0]).trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
        dic[key.uppercased()] = value.trimmingCharacters(in: CharacterSet.init(charactersIn: " ")).hasSuffix("=") ? "" : ((value.split("="))[1]).trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
    }
    return dic
}

func stringSet(string:String) -> Set<String> {
    var set = Set<String>()
    let arrayValue = string.split(CharacterSet(charactersIn: ";,"))
    for value in arrayValue {
        set.insert(value.uppercased().trimmingCharacters(in: CharacterSet.init(charactersIn: " ")))
    }
    return set
}

func intSet(string:String) -> Set<Int> {
    var set = Set<Int>()
    let arrayValue = string.split(CharacterSet(charactersIn: ";,"))
    for value in arrayValue {
        let stringItem = value.uppercased().trimmingCharacters(in: CharacterSet.init(charactersIn: " "))
        let intItem = stringItem.toInt()
        if intItem != nil  {
            set.insert(intItem!)
        }
    }
    return set
}

