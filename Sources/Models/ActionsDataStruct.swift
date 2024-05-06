//
//  ActionsDataStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 17.03.2021.
//

import Foundation

public struct ActionItem: Codable {
    let idItem: Int?                      // 0
    let sName: String?                    // 1
    let lUseInCard: Bool?                 // 2
    let admDate: String?                  // 3
    let sConst: String?                   // 4
    let lSelectDefault: Bool?             // 5
    let nItem: Int?                       // 6
    let lCreateButton: Bool?              // 7
    let lCheckAccess: Bool?               // 8
    let lRequestCode: Bool?               // 9
    let admUser: String?                  // 10
    let lOutParam: Bool?                  // 11
    let lRefresh: Bool?                   // 12
    let sField: String?                   // 13
    let nType: Int?                       // 14
    let lWithCommit: Bool?                // 15
    let lHideDLG: Bool?                   // 16
    let idAdmModule: Int?                 // 17
    let lCurWindow: Bool?                 // 18
    let lHideInList: Bool?                // 19
    let lMultiSelect: Bool?               // 20
    let nOrder: Int?                      // 21
    let lCloseAfter: Bool?                // 22
    let idReport: Int?                    // 23
    let lIdList: Bool?                    // 24
    let rel: String?                      // 25
    let lFreeZone: Bool?

    enum CodingKeys: String, CodingKey {

        case idItem = "ID"
        case sName = "SNAME"
        case lUseInCard = "LUSEINCARD"
        case admDate = "ADMDATE"
        case sConst = "SCONST"
        case lSelectDefault = "LSELECTDEFAULT"
        case nItem = "NITEM"
        case lCreateButton = "LCREATEBUTTON"
        case lCheckAccess = "LCHECKACCESS"
        case lRequestCode = "LREQUESTCODE"
        case admUser = "ADMUSER"
        case lOutParam = "LOUTPARAM"
        case lRefresh = "LREFRESH"
        case sField = "SFIELD"
        case nType = "NTYPE"
        case lWithCommit = "LWITHCOMMIT"
        case lHideDLG = "LHIDEDLG"
        case idAdmModule = "IDADMMODULE"
        case lCurWindow = "LCURWINDOW"
        case lHideInList = "LHIDEINLIST"
        case lMultiSelect = "LMULTISELECT"
        case nOrder = "NORDER"
        case lCloseAfter = "LCLOSEAFTER"
        case idReport = "IDREPORT"
        case lIdList = "LIDLIST"
        case rel = "REL"
        case lFreeZone = "LFREEZONE"

    }

    public init(from decoder: Decoder) throws {
//        print("struct ActionItem : Codable public init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("ActionItem.rawValues:\(values)")
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
        lUseInCard = try values.decodeIfPresent(Bool.self, forKey: .lUseInCard)
        admDate = try values.decodeIfPresent(String.self, forKey: .admDate)
        sConst = try values.decodeIfPresent(String.self, forKey: .sConst)
        lSelectDefault = try values.decodeIfPresent(Bool.self, forKey: .lSelectDefault)
        nItem = try values.decodeIfPresent(Int.self, forKey: .nItem)
        lCreateButton = try values.decodeIfPresent(Bool.self, forKey: .lCreateButton)
        lCheckAccess = try values.decodeIfPresent(Bool.self, forKey: .lCheckAccess)
        lRequestCode = try values.decodeIfPresent(Bool.self, forKey: .lRequestCode)
        admUser = try values.decodeIfPresent(String.self, forKey: .admUser)
        lOutParam = try values.decodeIfPresent(Bool.self, forKey: .lOutParam)
        lRefresh = try values.decodeIfPresent(Bool.self, forKey: .lRefresh)
        sField = try values.decodeIfPresent(String.self, forKey: .sField)
        nType = try values.decodeIfPresent(Int.self, forKey: .nType)
        lWithCommit = try values.decodeIfPresent(Bool.self, forKey: .lWithCommit)
        lHideDLG = try values.decodeIfPresent(Bool.self, forKey: .lHideDLG)
        idAdmModule = try values.decodeIfPresent(Int.self, forKey: .idAdmModule)
        lCurWindow = try values.decodeIfPresent(Bool.self, forKey: .lCurWindow)
        lHideInList = try values.decodeIfPresent(Bool.self, forKey: .lHideInList)
        lMultiSelect = try values.decodeIfPresent(Bool.self, forKey: .lMultiSelect)
        nOrder = try values.decodeIfPresent(Int.self, forKey: .nOrder)
        lCloseAfter = try values.decodeIfPresent(Bool.self, forKey: .lCloseAfter)
        idReport = try values.decodeIfPresent(Int.self, forKey: .idReport)
        lIdList = try values.decodeIfPresent(Bool.self, forKey: .lIdList)
        rel = try values.decodeIfPresent(String.self, forKey: .rel)
        lFreeZone = try values.decodeIfPresent(Bool.self, forKey: .lFreeZone)
    }
}

public struct ActionsData: Decodable {
    let _data: [ActionItem]?
    let _struct: [StructItem]?
    let _info: InfoObject?
    let _meta: MetaObject?

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
        _data = try values.decodeIfPresent([ActionItem].self, forKey: ._data)
        //        print("_data:\(String(describing: _data))")
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
    }
}
