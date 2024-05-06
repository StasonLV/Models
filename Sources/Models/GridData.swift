//
//  GridData.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 03.08.2022.
//

import Foundation
import SwiftUI

public struct GridData {
    var matrix:[([String:String], String)]
    var coloumnTitles: [Coloumn]
    var coloumnTitlesString: [String]
    var coloumnes: [String]
    var visiableColoumens: [String]
    var coloumnWidth: [CGFloat]
    var fullWidth: CGFloat
    var fullWidthVisiable: CGFloat
    var gridItemLayout = [GridItem]()
}

struct Coloumn {
    var caption:String
    var field:String
    var order:Int
    var type:String
    var precision:Int
    var visible:Bool
    var averageLength:Int
    var width:Int
    var required:Bool
    var scale:Int
    var columnWidth:CGFloat
    var nullable:Bool
}
