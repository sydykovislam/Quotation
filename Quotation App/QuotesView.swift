//
//  ContentView.swift
//  Quotation
//
//  Created by Sydykov Islam on 6/3/21.
//

import SwiftUI

struct QoutesView: View {
    
    @ObservedObject var viewModel = QuotesViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.quotes) { quote in
                        Row(quote: quote)
                    }
                    .redacted(reason: viewModel.isLoading ? .placeholder : [])
                }
                .navigationTitle("Quotation")
            }
            
            if viewModel.quotes.isEmpty {
                ProgressView()
            }
        }
    }
}

struct Row: View {
    let quote: Quote
        
    var body: some View {
        HStack(spacing: 12) {
         
            Image(systemName: quote.iconName)
              .resizable()
              .aspectRatio(nil, contentMode: .fit)
              .frame(width: 20)
                .unredacted()

            VStack(alignment: .leading) {
              Text(quote.content)
                .font(
                  .system(
                    size: 17,
                    weight: .medium,
                    design: .rounded
                  )
                )

              Text(quote.createdDate, style: .date)
                .font(
                  .system(
                    size: 15,
                    weight: .bold,
                    design: .rounded
                  )
                )
                .foregroundColor(.secondary)
            }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QoutesView()
    }
}

