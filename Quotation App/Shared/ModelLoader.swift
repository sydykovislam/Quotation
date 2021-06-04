//
//  ModelLoader.swift
//  Quotation
//
//  Created by Sydykov Islam on 6/3/21.
//

import Foundation

enum ModelLoader {
    static var bundledQuotes: [Quote] {
        
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json")
        else {
            return []
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode([Quote].self, from: data)
        } catch {
            return []
        }
    }
}
