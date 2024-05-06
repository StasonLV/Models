//
//  ModuleMenu.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 17.03.2021.
//

import Foundation

struct MenuList : Identifiable {
    
    var id: String {
        return parentRow?.sName ?? "NONE"
    }
    var parentRow : ModuleMenuItem?
    var childList : [ModuleMenuItem]
    var expanded : Bool
}

struct Menu  {
    var menu : [MenuList]
    
    init(menuItems:[ModuleMenuItem]) {
        var parentList = [MenuList]()
        let childList = [ModuleMenuItem]()
        var tailList = [ModuleMenuItem]()
        for i in menuItems.indices where menuItems[i].idParent == 0 {
            parentList.append(MenuList.init(parentRow: menuItems[i], childList: childList, expanded: false))
        }
        parentList = (parentList.sorted { item1, item2 in
            let order1 = item1.parentRow?.idMenuItem ?? 0
            let order2 = item2.parentRow?.idMenuItem ?? 0
            return order1 < order2
        })
        
        for i in menuItems.indices {
            if menuItems[i].idParent ?? 0 > 0 && menuItems[i].idParent != nil {
                parentList[abs(menuItems[i].idParent! - 1)].childList.append(menuItems[i])
            }
        }
        
        for i in parentList.indices {
            parentList[i].childList = (parentList[i].childList.sorted { item1, _ in
                let order1 = item1.idMenuItem
                let order2 = item1.idMenuItem
                return order1 ?? 0 < order2 ?? 0
            })
        }
        var i = 0
        var blackList = [Int]()
        while i < parentList.count {
            if parentList[i].childList.count == 0 {
                if parentList[i].parentRow?.idItem ?? 0 > 0 {
                    tailList.append(parentList[i].parentRow!)
                }
                blackList.append(i)
            }
            i += 1
        }
        var j = blackList.count
        while j >= 1 {
            parentList.remove(at: blackList[j-1])
            j -= 1
        }
        if tailList.count > 0 {
            tailList = (tailList.sorted { item1, _ in
                let order1 = item1.idMenuItem
                let order2 = item1.idMenuItem
                return order1 ?? 0 < order2 ?? 0
            })
            parentList.append(MenuList.init(parentRow: nil, childList: tailList, expanded: false))
        }
        menu = parentList
//        for row in parentList {
//            print("parentRow sName:\(String(describing: row.parentRow?.sName)) \(String(describing: row.parentRow?.idParent))")
//            if row.parentRow?.sName == nil && row.parentRow?.idParent == 0 {
//                for row in row.childList {
//                    print("parentRow sName:\(String(describing: row.sName)) \(String(describing: row.idParent))")
//                }
//            }
//        }
    }
}

struct ModuleMenuItem : Codable, Identifiable {
    
    var id: String {
        return sName ?? "NONE"
    }
    let idMenuItem: Int?                                    // 01
    var sName: String?                                      // 02
    let idParent: Int?                                      // 03
    let lFirstLoadRecord:Bool?                              // 04
    let idItem: Int?                                        // 05
    let nOneToMany: Int?                                    // 06
    let lShow: Bool?                                        // 07
    let lNotCard: Bool?                                     // 08
    let lEdit: Bool?                                        // 09
    let lNew: Bool?                                         // 10
    let lDelete: Bool?                                      // 11
    let lPrint: Bool?                                       // 12
    let lCanList: Bool?                                     // 13
    let idAdmMenuType: Int?                                 // 14
    let sIconName: String?                                  // 15
    let lModalFormStyle: Bool?                              // 16
    let lNewRecordMethod: Bool?                             // 17
    let actionsCur: [ActionItem]?                           // 18
    let oneToManyCur: [OneToManyItem]?                      // 19
    let prnSQLCur: [PrnSqlItem]?                            // 20
    var filterCur: [DataItem]?                              // 21
    let wizardCur: [WizardItem]?                            // 22
    let lFreeZone: Bool?                                    // 23
    let idMenuItemRel: String?                              // 24
    
    enum CodingKeys: String, CodingKey {
        
        case idMenuItem = "ID"
        case sName = "SNAME"
        case idParent = "IDPARENT"
        case lFirstLoadRecord = "LFIRSTLOADRECORD"
        case idItem = "IDITEM"
        case nOneToMany = "NONETOMANY"
        case lShow = "LSHOW"
        case lNotCard = "LNOTCARD"
        case lEdit = "LEDIT"
        case lNew = "LNEW"
        case lDelete = "LDELETE"
        case lPrint = "LPRINT"
        case lCanList = "LCANLIST"
        case idAdmMenuType = "IDADMMENUTYPE"
        case sIconName = "SICONNAME"
        case lModalFormStyle = "LMODALFORMSTYLE"
        case lNewRecordMethod = "LNEWRECORDMETHOD"
        case actionsCur = "ACTIONSCUR"
        case oneToManyCur = "ONETOMANYCUR"
        case prnSQLCur = "PRNSQLCUR"
        case filterCur = "FILTERCUR"
        case wizardCur = "WIZARDCUR"
        case lFreeZone = "LFREEZONE"
        case idMenuItemRel = "IDMENUITEMREL"
    }
    
    public init(
        idMenuItem:Int?,                                        // 01
        sName:String?,                                          // 02
        idParent:Int?,                                          // 03
        lFirstLoadRecord:Bool?,                                 // 04
        idItem:Int?,                                            // 05
        nOneToMany:Int?,                                        // 06
        lShow:Bool?,                                            // 07
        lNotCard:Bool?,                                         // 08
        lEdit:Bool?,                                            // 09
        lNew:Bool?,                                             // 10
        lDelete:Bool?,                                          // 11
        lPrint:Bool?,                                           // 12
        lCanList:Bool?,                                         // 13
        idAdmMenuType:Int?,                                     // 14
        sIconName:String?,                                      // 15
        lModalFormStyle: Bool?,                                 // 16
        lNewRecordMethod: Bool?,                                // 17
        actionsCur: [ActionItem]?,                              // 18
        oneToManyCur: [OneToManyItem]?,                         // 19
        prnSQLCur: [PrnSqlItem]?,                               // 20
        filterCur: [DataItem]?,                                 // 21
        wizardCur: [WizardItem]?,                               // 22
        lFreeZone: Bool?,                                       // 23
        idMenuItemRel: String?                                  // 24
    )
    {
        self.idMenuItem = idMenuItem                            // 01
        self.sName = sName                                      // 02
        self.idParent = idParent                                // 03
        self.lFirstLoadRecord = lFirstLoadRecord                // 04
        self.idItem = idItem                                    // 05
        self.nOneToMany = nOneToMany                            // 06
        self.lShow = lShow                                      // 07
        self.lNotCard = lNotCard                                // 08
        self.lEdit = lEdit                                      // 09
        self.lNew = lNew                                        // 10
        self.lDelete = lDelete                                  // 11
        self.lPrint = lPrint                                    // 12
        self.lCanList = lCanList                                // 13
        self.idAdmMenuType = idAdmMenuType                      // 14
        self.sIconName = sIconName                              // 15
        self.lModalFormStyle = lModalFormStyle                  // 16
        self.lNewRecordMethod = lNewRecordMethod                // 17
        self.oneToManyCur = oneToManyCur                        // 18
        self.actionsCur = actionsCur                            // 19
        self.prnSQLCur = prnSQLCur                              // 20
        self.filterCur = filterCur                              // 21
        self.wizardCur = wizardCur                              // 22
        self.lFreeZone = lFreeZone                              // 23
        self.idMenuItemRel = idMenuItemRel                      // 24
    }
    
    static func == (left: ModuleMenuItem, right:ModuleMenuItem) -> Bool {
        return left.idMenuItem == right.idMenuItem
    }
    
    init(from decoder: Decoder) throws {
//        print("struct ModuleMenuItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        print("ModuleMenuItem.rawValues:\(values)")
        idMenuItem = try values.decodeIfPresent(Int.self, forKey: .idMenuItem)
//        print("idMenuItem:\(String(describing: idMenuItem))")
        sName = try values.decodeIfPresent(String.self, forKey: .sName)
//        print("sName:\(String(describing: sName))")
        idParent = try values.decodeIfPresent(Int.self, forKey: .idParent)
//        print("idParent:\(String(describing: idParent))")
        lFirstLoadRecord = try values.decodeIfPresent(Bool.self, forKey: .lFirstLoadRecord)
//        print("lFirstLoadRecord:\(String(describing: lFirstLoadRecord))")
        idItem = try values.decodeIfPresent(Int.self, forKey: .idItem)
//        print("idItem:\(String(describing: idItem))")
        nOneToMany = try values.decodeIfPresent(Int.self, forKey: .nOneToMany)
//        print("nOneToMany:\(String(describing: nOneToMany))")
        lShow = try values.decodeIfPresent(Bool.self, forKey: .lShow)
//        print("lShow:\(String(describing: lShow))")
        lNotCard = try values.decodeIfPresent(Bool.self, forKey: .lNotCard)
//        print("lNotCard:\(String(describing: lNotCard))")
        lEdit = try values.decodeIfPresent(Bool.self, forKey: .lEdit)
//        print("lEdit:\(String(describing: lEdit))")
        lNew = try values.decodeIfPresent(Bool.self, forKey: .lNew)
//        print("lNew:\(String(describing: lNew))")
        lDelete = try values.decodeIfPresent(Bool.self, forKey: .lDelete)
//        print("lDelete:\(String(describing: lDelete))")
        lPrint = try values.decodeIfPresent(Bool.self, forKey: .lPrint)
//        print("lPrint:\(String(describing: lPrint))")
        lCanList = try values.decodeIfPresent(Bool.self, forKey: .lCanList)
//        print("lCanList:\(String(describing: lCanList))")
        idAdmMenuType = try values.decodeIfPresent(Int.self, forKey: .idAdmMenuType)
//        print("idAdmMenuType:\(String(describing: idAdmMenuType))")
        let iconName = try values.decodeIfPresent(String.self, forKey: .sIconName)
        
        let arrayIconName = iconName?.split(separator: " ")
        if arrayIconName?.count == 2 {
            sIconName = String(arrayIconName?[1] ?? "")
        } else if arrayIconName?.count == 1 {
            sIconName = String(arrayIconName?[0] ?? "")
        } else  {
            sIconName = nil
        }
//        print("sIconName:\(String(describing: sIconName))")
        lModalFormStyle = try values.decodeIfPresent(Bool.self, forKey: .lModalFormStyle)
//        print("lModalFormStyle:\(String(describing: lModalFormStyle))")
        lNewRecordMethod = try values.decodeIfPresent(Bool.self, forKey: .lNewRecordMethod)
//        print("lNewRecordMethod:\(String(describing: lNewRecordMethod))")
        actionsCur = try values.decodeIfPresent([ActionItem].self, forKey: .actionsCur)
//        print("actionsCur:\(String(describing: actionsCur?.count))")
        oneToManyCur = try values.decodeIfPresent([OneToManyItem].self, forKey: .oneToManyCur)
//        print("oneToManyCur:\(String(describing: oneToManyCur?.count))")
        prnSQLCur = try values.decodeIfPresent([PrnSqlItem].self, forKey: .prnSQLCur)
//        print("prnSQLCur:\(String(describing: prnSQLCur?.count))")
        let filters = try values.decodeIfPresent([DataItem].self, forKey: .filterCur)
        filterCur = filters?.sorted(by: { $0.nOrder ?? 0 < $1.nOrder ?? 0 })
//        print("filterCur:\(String(describing: filterCur?.count))")
        wizardCur = try values.decodeIfPresent([WizardItem].self, forKey: .wizardCur)
//        print("wizardCur:\(String(describing: wizardCur?.count))")
        lFreeZone = try values.decodeIfPresent(Bool.self, forKey: .lFreeZone)
//        print("lFreeZone:\(String(describing: lFreeZone))")
        idMenuItemRel = try values.decodeIfPresent(String.self, forKey: .idMenuItemRel)
    }
}

struct ModuleMenu : Decodable {
    let _data : [ModuleMenuItem]?
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
//        print("struct ModuleMenuData : Codable init")
        //        print("CodingKeys.self: \(CodingKeys.self)")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        print("values: \(values)")
        _data = try values.decodeIfPresent([ModuleMenuItem].self, forKey: ._data)
        //        print("_data:\(String(describing: _data))")
//        for item in _data ?? [] {
//            print("MenuRow sName:\(String(describing: item.sName)) idParent: \(String(describing: item.idParent)) idItem:\(String(describing: item.idItem)) lShow: \(String(describing: item.lShow))")
//        }
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
        //        print("_meta: \(String(describing: _meta))")
        
    }
    
}

typealias RawModuleMenuData = [ModuleMenu]
