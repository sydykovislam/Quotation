//
//  QuotesModelView.swift
//  Quotation
//
//  Created by Sydykov Islam on 6/3/21.
//

import SwiftUI

class QuotesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var quotes: [Quote] = []
    
    //initialization with simulated "network" delay
    init() {
        isLoading = true
        
        let simulatedRequestDelay = Double.random(in: 1..<3)
        
        delay(interval: simulatedRequestDelay) {
            self.quotes = ModelLoader.bundledQuotes
        }
        
        let simulatedIngestionDelay = Double.random(in: 1..<3)
        
        delay(interval: simulatedIngestionDelay) {
            self.isLoading = false
        }
    }
    
    //Creating similated delay
    private func delay(interval: TimeInterval, block: @escaping () -> Void) {
      DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        block()
      }
    }
    
    

}
