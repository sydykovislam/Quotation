//
//  QuotesModelView.swift
//  Quotation
//
//  Created by Sydykov Islam on 6/3/21.
//

import SwiftUI

class QuotesViewModel: ObservableObject {
    
    @Published var shouldConseal = false
    @Published var isLoading: Bool = false
    @Published var quotes: [Quote] = []
    
    var shouldHideContent:Bool {
        return shouldConseal || isLoading
    }
    
    //initialization with simulated "network" delay
    init() {
        beginObserving()
        isLoading = true
        
        let simulatedRequestDelay = Double.random(in: 1..<3)
        
        delay(interval: simulatedRequestDelay) {
            self.quotes = ModelLoader.bundledQuotes
        }
        
        let simulatedIngestionDelay = Double.random(in: 2..<4)
        
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
    
    private func beginObserving() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        center.addObserver(self, selector: #selector(appMovedToFourground), name: UIApplication.didBecomeActiveNotification, object: nil)
        
    }
    
    @objc func appMovedToBackground() {
        shouldConseal = true
    }
    
    @objc func appMovedToFourground() {
        shouldConseal = false
    }

}
