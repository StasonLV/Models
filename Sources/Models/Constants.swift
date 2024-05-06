//
//  Constants.swift
//  RESO-OSAGO
//
//  Created by Ivan Kushelev on 07.03.2021.
//

import Foundation

struct Constants {
    static let useAsyncVersion = true // feature-флаг использования реализации сетевых запросов через новую модель параллелизма
    static let recipientMail = "online@reso.ru"
    static let applicationName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String != nil ? Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String : ""
}
