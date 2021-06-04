//
//  Quote.swift
//  Quotation
//
//  Created by Sydykov Islam on 6/3/21.
//

import Foundation

struct Quote: Codable, Identifiable, Equatable {
    var id: String
    var content: String
    var createdDate: Date
    var iconName: String
    
    init() {
        id = "default"
        content = "Focus on your goal. Don't look in any direction but ahead."
        createdDate = Date()
        iconName = "sun.min.fill"
    }
}
