//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Luthfi Khan on 28/05/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T{
        guard let url =  self.url(forResource: file, withExtension: nil)else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decode = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decode.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decode.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
