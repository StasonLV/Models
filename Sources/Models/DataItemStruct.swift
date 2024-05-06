//
//  FilterStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 18.03.2021.
//

import Foundation

struct DataItem: Codable, Identifiable {
    
    var id: Int {
        return idItem ?? 0
    }
    
    var nullable:Bool?                     // 0
    let idFilter:Int?                      // 1
    let idItem:Int?                        // 2
    let sName:String?                      // 3
    let sNameRus:String?                   // 4
    let lSuperSelect:Bool?                 // 5
    let lRequireSearch:Bool?               // 6
    let lManyValues:Bool?                  // 7
    let lRequired:Bool?                    // 8
    let lRequiredOne:Bool?                 // 9
    let nOrder:Int?                        // 10
    let idAdmModule:Int?                   // 11
    let sType:String?                      // 12
    let sDefault:String?                   // 13
    let sSQLWhereCode:String?              // 14
    let precision:Int?                     // 15
    let oraPrecision:Int?                  // 16
    let scale:Int?                         // 17
    let visible:Bool?                      // 18
    let readOnly:Bool?                     // 19
    var dictionaryName:String?             // 20
    var selectedIdInDictionary : [String]? // 21
    var value : String?                    // 22
    var valueAsParam : String?             // 23
    var filled:Bool?                       // 24
    let webFields : [WebFieldItem]?        // 25 *
    let field : String?                    // 26
    let caption : String?                  // 27
    let dictionaryType : String?           // 28
    var dictionaryID : Int?                // 29
    var mimeType : String?                 // 30
    let signed : Bool?                     // 31
    let nPage : Int?                       // 32
    let sKeyField:String?                  // 33
    let sNameField:String?                 // 34
    var rowID:String?                      // 35
    var isSelected:Bool?                   // 36
    var html:String?                       // 37
    let _required:Bool?
    let _requiredOne:Bool?
    let _type:String?
    let _order:Int?
    
    enum CodingKeys: String, CodingKey {
        
        case nullable = "NULLABLE"
        case idFilter = "ID"
        case idItem = "IDITEM"
        case sName = "SNAME"
        case sNameRus = "SNAMERUS"
        case lSuperSelect = "LSUPERSELECT"
        case lRequireSearch = "LREQUIRESEARCH"
        case lManyValues = "LMANYVALUES"
        case lRequired = "LREQUIRED"
        case lRequiredOne = "LREQUIREDONE"
        case nOrder = "NORDER"
        case idAdmModule = "IDADMMODULE"
        case sType = "STYPE"
        case sDefault = "SDEFAULT"
        case sSQLWhereCode = "SSQLWHERECODE"
        case precision = "PRECISION"
        case oraPrecision = "ORA_PRECISION"
        case scale = "SCALE"
        case visible = "VISIBLE"
        case readOnly = "READONLY"
        case dictionaryName = "DICTIONARY_NAME"
        case selectedIdInDictionary = "SELECTED_ID_IN_DICTIONARY"
        case value = "VALUE"
        case valueAsParam = "VALUE_AS_PARAM"
        case filled = "FILLED"
        case webFields = "WEBFIELDS"    // *
        case field = "FIELD"
        case caption = "CAPTION"
        case dictionaryType = "DICTIONARY_TYPE"
        case dictionaryID = "DICTIONARY_ID"
        case mimeType = "MIMETYPE"
        case signed = "SIGNED"
        case nPage = "NPAGE"
        case sKeyField = "SKEYFIELD"
        case sNameField = "SNAMEFIELD"
        case rowID = "ROWID"
        case isSelected = "ISSELECTED"
        case html = "HTML"
        case _required = "REQUIRED"
        case _requiredOne = "REQUIREDONE"
        case _type = "TYPE"
        case _order = "ORDER"
    }
    
    init(from decoder: Decoder) throws {
//        print("struct ActionItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("ActionItem.rawValues:\(values)")
        nullable = try values.decodeIfPresent(Bool.self, forKey: .nullable)
        idFilter = try values.decodeIfPresent(Int.self, forKey: .idFilter)
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
        sNameRus = try values.decodeIfPresent(String.self, forKey: .sNameRus)
        lSuperSelect = try values.decodeIfPresent(Bool.self, forKey: .lSuperSelect)
        lRequireSearch = try values.decodeIfPresent(Bool.self, forKey: .lRequireSearch)
        lManyValues = try values.decodeIfPresent(Bool.self, forKey: .lManyValues)
        let lRequiredRaw = try values.decodeIfPresent(Bool.self, forKey: .lRequired)
        _required = try values.decodeIfPresent(Bool.self, forKey: ._required)
        let lRequiredByNullable = lRequiredRaw != nil ? (lRequiredRaw) : _required
        let nullableRaw = nullable
        lRequired = lRequiredByNullable ?? false || !(nullableRaw ?? true)
        let lRequiredOneRaw = try values.decodeIfPresent(Bool.self, forKey: .lRequiredOne)
        _requiredOne = try values.decodeIfPresent(Bool.self, forKey: ._requiredOne)
        lRequiredOne = lRequiredOneRaw != nil ? lRequiredOneRaw : _requiredOne
        let nOrderRaw = try values.decodeIfPresent(Int.self, forKey: .nOrder)
        _order = try values.decodeIfPresent(Int.self, forKey: ._order)
        nOrder = nOrderRaw != nil ? nOrderRaw : _order
        idAdmModule = try values.decodeIfPresent(Int.self, forKey: .idAdmModule)
        let sTypeRaw = try values.decodeIfPresent(String.self, forKey: .sType)
        _type = try values.decodeIfPresent(String.self, forKey: ._type)
        sType = sTypeRaw != nil ? sTypeRaw : _type
        sDefault = try values.decodeIfPresent(String.self, forKey: .sDefault)
        sSQLWhereCode = try values.decodeIfPresent(String.self, forKey: .sSQLWhereCode)
        precision = try values.decodeIfPresent(Int.self, forKey: .precision)
        oraPrecision = try values.decodeIfPresent(Int.self, forKey: .oraPrecision)
        scale = try values.decodeIfPresent(Int.self, forKey: .scale)
        visible = try values.decodeIfPresent(Bool.self, forKey: .visible)
        readOnly = try values.decodeIfPresent(Bool.self, forKey: .readOnly)
        dictionaryName = try values.decodeIfPresent(String.self, forKey: .dictionaryName)
        selectedIdInDictionary = try values.decodeIfPresent([String].self, forKey: .selectedIdInDictionary)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        valueAsParam = try values.decodeIfPresent(String.self, forKey: .valueAsParam)
        filled = try values.decodeIfPresent(Bool.self, forKey: .filled)
        webFields = try values.decodeIfPresent([WebFieldItem].self, forKey: .webFields)     // *
        field = try values.decodeIfPresent(String.self, forKey: .field)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        dictionaryType = try values.decodeIfPresent(String.self, forKey: .dictionaryType)
        dictionaryID = try values.decodeIfPresent(Int.self, forKey: .dictionaryID)
        signed = try values.decodeIfPresent(Bool.self, forKey: .signed)
        nPage = try values.decodeIfPresent(Int.self, forKey: .nPage)
        sKeyField = try values.decodeIfPresent(String.self, forKey: .sKeyField)
        sNameField = try values.decodeIfPresent(String.self, forKey: .sNameField)
        rowID = try values.decodeIfPresent(String.self, forKey: .rowID)
        isSelected = try values.decodeIfPresent(Bool.self, forKey: .isSelected)
        html = try values.decodeIfPresent(String.self, forKey: .html)
        
        if sType?.lowercased() == "blob" && value?.count ?? 0 > 0 {
            let strBase64 = value!
            let dataDecoded : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
            var c = [UInt32](repeating: 0, count: 1)
            (dataDecoded as NSData).getBytes(&c, length: 1)

            switch c[0] {
            case 208:
                mimeType = "doc"
                // PDF - 25 50 44 46 2D пять первых байт
            case 37:
                mimeType = "pdf"
                // DOC
            case 123:
                mimeType = "rtf"
            case 0xFF, 0xD8:
                mimeType = "jpg"
            case 0x89, 0x50, 0x4E, 0x0D, 0x0A, 0x1A:   // 137 - png
                mimeType = "png"
            case 0x49, 0x4D:
                mimeType = "tiff"
            case 0x00, 66:
                mimeType = "png"
            case 0x47:
                mimeType = "gif"
            case 0x20:
                mimeType = "heic"
                
            default:
                mimeType = "unknown: \(c[0])"
            }
        }
    }
    
    public init (idFilter:Int?, sKeyField:String?, sNameField:String?, lManyValues:Bool?, rowID:String?, value:String?, isSelected:Bool?
    ){
        self.nullable = nil
        self.idFilter = idFilter
        self.idItem = idFilter
        self.sName = nil
        self.sNameRus = nil
        self.lSuperSelect = nil
        self.lRequireSearch = nil
        self.lRequired = nil
        self.lRequiredOne = nil
        self.nOrder = nil
        self.idAdmModule = nil
        self.sType = nil
        self.sDefault = nil
        self.sSQLWhereCode = nil
        self.precision = nil
        self.oraPrecision = nil
        self.scale = nil
        self.visible = nil
        self.readOnly = nil
        self.dictionaryName = nil
        self.selectedIdInDictionary = nil
        self.filled = nil
        self.webFields = nil
        self.field = nil
        self.caption = nil
        self.dictionaryType = nil
        self.dictionaryID = nil
        self.mimeType = nil
        self.signed = nil
        self.nPage = nil
        self.sKeyField = sKeyField
        self.sNameField = sNameField
        self.lManyValues = lManyValues
        self.rowID = rowID
        self.value = value
        self.valueAsParam = nil
        self.isSelected = isSelected
        self.html = nil
        self._required = nil
        self._requiredOne = nil
        self._type = nil
        self._order = nil
    }
    
    public init (structItem:StructItem, value:String?
    ){
        self.nullable = structItem.nullable
        self.idFilter = nil
        self.idItem = nil
        self.sName = nil
        self.sNameRus = nil
        self.lSuperSelect = nil
        self.lRequireSearch = nil
        self.lRequired = structItem.required
        self.lRequiredOne = structItem.requiredOne
        self.nOrder = structItem.order
        self.idAdmModule = nil
        self.sType = structItem.type
        self.sDefault = nil
        self.sSQLWhereCode = nil
        self.precision = structItem.precision
        self.oraPrecision = structItem.oraPrecision
        self.scale = structItem.scale
        self.visible = structItem.visible
        self.readOnly = structItem.readonly
        self.dictionaryName = nil
        self.selectedIdInDictionary = nil
        self.filled = nil
        self.webFields = nil
        self.field = structItem.field
        self.caption = structItem.caption
        self.dictionaryType = nil
        self.dictionaryID = nil
        self.mimeType = nil
        self.signed = structItem.signed
        self.nPage = nil
        self.sKeyField = nil
        self.sNameField = nil
        self.lManyValues = structItem.lManyValues
        self.rowID = nil
        self.value = value
        self.valueAsParam = nil
        self.isSelected = nil
        self.html = nil
        self._required = nil
        self._requiredOne = nil
        self._type = nil
        self._order = nil
    }
    
    public init (sType: String?, caption: String?, lRequired: Bool?, nOrder: Int?, value: String?, field: String?, visible: Bool?, readOnly: Bool?
    ){
        self.nullable = nil
        self.idFilter = nil
        self.idItem = nil
        self.sName = nil
        self.sNameRus = nil
        self.lSuperSelect = nil
        self.lRequireSearch = nil
        self.lRequired = lRequired
        self.lRequiredOne = nil
        self.nOrder = nOrder
        self.idAdmModule = nil
        self.sType = sType
        self.sDefault = nil
        self.sSQLWhereCode = nil
        self.precision = nil
        self.oraPrecision = nil
        self.scale = nil
        self.visible = visible
        self.readOnly = readOnly
        self.dictionaryName = nil
        self.selectedIdInDictionary = nil
        self.filled = nil
        self.webFields = nil
        self.field = field
        self.caption = caption
        self.dictionaryType = nil
        self.dictionaryID = nil
        self.mimeType = nil
        self.signed = nil
        self.nPage = nil
        self.sKeyField = nil
        self.sNameField = nil
        self.lManyValues = nil
        self.rowID = nil
        self.value = value
        self.valueAsParam = nil
        self.isSelected = nil
        self.html = nil
        self._required = nil
        self._requiredOne = nil
        self._type = nil
        self._order = nil
    }
}

struct DataSource : Decodable {
    let _data : [DataItem]?
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
        print("struct ActionsData : Codable init")
        //        print("CodingKeys.self: \(CodingKeys.self)")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        print("values: \(values)")
        
        let data = try values.decodeIfPresent([DataItem].self, forKey: ._data)
        _data = data?.sorted(by: { $0.nOrder ?? 0 < $1.nOrder ?? 0 })
        //        print("_data:\(String(describing: _data))")
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
}

typealias RawFiltersData = [DataSource]

struct DataCardData : Decodable {
    var _data : [DataItem]?
    var _struct : [StructItem]?
    let _info : InfoObject?
    let _meta : MetaObject?
    let rawData : [[String:GenericValue]]?
    
    enum CodingKeys: String, CodingKey {
        
        case _data = "_datatemp"
        case _struct = "_struct"
        case _info = "_info"
        case _meta = "_meta"
        case rawData = "_data"
    }
    
    public init (_data:[DataItem]?, _struct:[StructItem]?, _info:InfoObject?, _meta:MetaObject?
                 
    ){
        self._data = _data
        self._struct = _struct
        self._info = _info
        self._meta = _meta
        self.rawData = nil
    }
    
    init(from decoder: Decoder) throws {
        print("struct DataCardData : Codable init")
        print("CodingKeys.self: \(CodingKeys.self)")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
        
        print("values: \(values)")
        
        let rawData = try values.decodeIfPresent([[String:GenericValue]].self, forKey: .rawData)
        var rawDataItems = [DataItem]()
        print("rawData: \(String(describing: rawData?.count))")
        if rawData?.count ?? 0 > 0 {
            for item in _struct ?? [StructItem]() {
                let value = item.field != nil ? rawData![0]["\(item.field!)"]?.value : ""
                if value?.count ?? 0 > 0 {
                    print("99999 \(String(describing: item.field)): \(String(describing: value))")
                }
                let tempDataItem = DataItem(structItem: item, value: value)
                rawDataItems.append(tempDataItem)
            }
        }
        _data = rawDataItems
        print("_data:\(String(describing: _data))")
        self.rawData = rawData
    }
}

extension DataCardData {
    public enum GenericValue: Codable {
        case stringValue(String)
        case intValue(Int)
        case boolValue(Bool)
        case doubleValue(Double)
        case unknown
    }
}

extension DataCardData.GenericValue {
    
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

extension DataCardData.GenericValue {
    
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

extension DataCardData.GenericValue {
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
