//
//  DashBoardModel.swift
//  RESO-OSAGO
//
//  Created by Ivan Kushelev on 03.08.2022.
//

import Foundation

struct DashBoardItem: Codable, Identifiable {
    
    var id: String {
        return sType ?? "NONE"
    }
    
    let dbID : Int?
    let idAction : Int?
    let lEnable : Bool?
    let lVisible : Bool?
    let nHeight : Int?
    let nLeft : Int?
    let nTop : Int?
    let nWidth : Int?
    let nBadge : String?
    let sIcon : String?
    let sBkImage : String?
    let sText1 : String?
    let sText2 : String?
    let sTextColor : String?
    let sType : String?
    let sIcoColor : String?
    let sParams : String?
    let binBkImage : String?
    let binIcon : String?
    let idBaner : Int?
    let nOrder : Int?
    
    enum CodingKeys: String, CodingKey {
        case dbID = "ID"
        case idAction = "IDACTION"
        case lEnable = "LENABLE"
        case lVisible = "LVISIBLE"
        case nHeight = "NHEIGHT"
        case nLeft = "NLEFT"
        case nTop = "NTOP"
        case nWidth = "NWIDTH"
        case nBadge = "SBADGE"
        case sIcon = "SICON"
        case sBkImage = "SBKIMAGE"
        case sText1 = "STEXT1"
        case sText2 = "STEXT2"
        case sTextColor = "STEXTCOLOR"
        case sType = "STYPE"
        case sIcoColor =  "SICOCOLOR"
        case sParams = "SPARAMS"
        case binBkImage = "BINBKIMAGE"
        case binIcon = "BINICON"
        case idBaner = "IDBANER"
        case nOrder = "NORDER"
    }
    
    public init(from decoder: Decoder) throws {
        print("struct ActionItem : Codable init")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("ActionItem.rawValues:\(values)")
        dbID = try values.decodeIfPresent(Int.self, forKey: .dbID)
        idAction = try values.decodeIfPresent(Int.self, forKey: .idAction)
        lEnable = try values.decodeIfPresent(Bool.self, forKey: .lEnable)
        lVisible = try values.decodeIfPresent(Bool.self, forKey: .lVisible)
        nHeight = try values.decodeIfPresent(Int.self, forKey: .nHeight)
        nLeft = try values.decodeIfPresent(Int.self, forKey: .nLeft)
        nTop = try values.decodeIfPresent(Int.self, forKey: .nTop)
        nWidth = try values.decodeIfPresent(Int.self, forKey: .nWidth)
        nBadge = try values.decodeIfPresent(String.self, forKey: .nBadge)
        sIcon = try values.decodeIfPresent(String.self, forKey: .sIcon)
        sBkImage = try values.decodeIfPresent(String.self, forKey: .sBkImage)
        sText1 = try values.decodeIfPresent(String.self, forKey: .sText1)
        sText2 = try values.decodeIfPresent(String.self, forKey: .sText2)
        sTextColor = try values.decodeIfPresent(String.self, forKey: .sTextColor)
        sType = try values.decodeIfPresent(String.self, forKey: .sType)
        sIcoColor = try values.decodeIfPresent(String.self, forKey: .sIcoColor)
        sParams = try values.decodeIfPresent(String.self, forKey: .sParams)
        binBkImage = try values.decodeIfPresent(String.self, forKey: .binBkImage)
        binIcon = try values.decodeIfPresent(String.self, forKey: .binIcon)
        idBaner = try values.decodeIfPresent(Int.self, forKey: .idBaner)
        nOrder = try values.decodeIfPresent(Int.self, forKey: .nOrder)
    }
    // 0
    
}

struct DashBoardData: Decodable {
    let _data: [DashBoardItem]?
    let _struct: [StructItem]?
    let _info: InfoObject?
    let _meta: MetaObject?
    
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
        _data = try values.decodeIfPresent([DashBoardItem].self, forKey: ._data)
        //        print("_data:\(String(describing: _data))")
        _struct = try values.decodeIfPresent([StructItem].self, forKey: ._struct)
        //        print("_struct: \(String(describing: _struct))")
        _info = try values.decodeIfPresent(InfoObject.self, forKey: ._info)
        //        print("_info: \(String(describing: _info))")
        _meta = try values.decodeIfPresent(MetaObject.self, forKey: ._meta)
        //        print("_meta: \(String(describing: _meta))")
        
    }
    
}

/*
 
 id - код
 stype, -- Тип элемента управления (button, banner, login, title, titleMain). Наверняка, по мере развития, добавятся еще типы, но это конечное число.
 nwidth, -- Ширина в у.е. Предлагаю считать ширину экрана = 6 у.е.
 nheight, -- Высота в у.е.
 nLeft, -- Левая координата в у.е.
 nTop, -- Номер строки. Верхняя координата.
 stext1, -- Текст 1.
 stext2, -- Текст 2.
 stextcolor, -- Цвет текста.
 sbkcolor, -- Цвет фона.
 sbkimage, -- Картинка фона.
 sicon, -- Иконка.
 idAction, -- Действие
 lenable, -- Доступность
 lvisible, -- Видимость, не уверен что нужно???
 stype
 sIcoColor -- Цвет Иконки
 sparams -
 
 
 ID = 2;
 IDACTION = 12103;
 LENABLE = 1;
 LVISIBLE = 1;
 NHEIGHT = 2;
 NLEFT = 1;
 NTOP = 5;
 NWIDTH = 6;
 STYPE = banner;
 
 SICOCOLOR = 0x5cab38;
 SPARAMS VARCHAR2(255)  [Доп. параметры]
 BINBKIMAGE - BLOB [Картинка фона]
 BINICON - BLOB [Иконка]
 IDBANER NUMBER(16) [Код банера]
 NORDER - NUMBER(16) [Приоритет баннера]
 
 */
