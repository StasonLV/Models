//
//  DataSourceStruct.swift
//  ResoOffice2
//
//  Created by Ivan Kushelev on 03.08.2022.
//

import Foundation
import SwiftUI

class DataSourceStruct: ObservableObject {
    
    @Published var screenStack : [ScreenContainer] = []
    
    @Published var moduleIndex:Int = 0
    
    @Published var menuIndex:Int = 0
    
    @Published var nextMenuIndex: Int = 0
    
    @Published var moduleMenuRow:ModuleMenuItem?
    
    @Published var dictionarySource: [DataItem] = []
    
    @Published var menuFilters = [DataItem]()
    
    @Published var dataCard:DataCardData?
    
    @Published var moduleMenuData: ModuleMenuData?
    
    @Published var grid: GridData = GridData(matrix: [([String : String](), "")], coloumnTitles: [Coloumn](), coloumnTitlesString: [String](), coloumnes: [String](), visiableColoumens: [String](), coloumnWidth: [CGFloat](), fullWidth: 0, fullWidthVisiable: 0)
    
    @Published var dictionaryText = DataItem.init(idFilter: nil, sKeyField: nil, sNameField: nil, lManyValues: nil, rowID: nil, value: nil, isSelected: nil)
    
    @Published var listTableViewDataSource = [(rowID:String, fields:[String:String], attributedString:NSAttributedString?)]()
    
    @Published var filterGridMatrix = [([String:String], String)]()
    
    @Published var moduleMenuRowStack = [ModuleMenuItem]()
    
}
