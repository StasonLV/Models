//
//  Product.swift
//  PageTabView
//
//  Created by Virgo on 22.02.2024.
//

import Foundation
import SwiftUI

public struct Product: Codable, Identifiable {
    
    public var id     : Int
    var name   : String
    var text   : String
    var color1 : String
    var color2 : String
    var image  : String
    var url    : String
}
