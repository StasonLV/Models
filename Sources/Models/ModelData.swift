//
//  ModelData.swift
//  PageTabView
//
//  Created by Virgo on 22.02.2024.
//

import Foundation

//var products: [Product] = load("products.json")
//
//func loadJson<T: Decodable>(_ filename: String) throws -> T {
//    let data: Data
//    
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        throw RequestError.customError("Couldn't find \(filename) in main bundle.")
//    }
//    
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        throw RequestError.customError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//    
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        throw RequestError.customError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//    
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//    
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//    
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}
//
//func TestJson() {
//    let data: Data
//    let filename: String = "Product.swift"
//    
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//    
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//    
//    do {
//        if let json = try JSONSerialization.jsonObject(with: data,
//                                options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject] {
//            print("Весь JSON Array<[String : AnyObject]>  json: \(json)")
//        } else {
//            print("заменить Array<[String : AnyObject]> на другую модель")
//        }
//    } catch {
//        print("json error: \(error)")
//    }
//}
