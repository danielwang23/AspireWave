//
//  QuoteCollectionsView.swift
//  AspireWave
//
//  Created by Daniel Wang on 9/1/24.
//

import SwiftUI

struct QuoteCollectionsView: View {
    @Environment(\.presentationMode) var presentationMode
    let savedQuotes: [(text: String, author: String)]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .padding()
                    .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.top, 20) // Adjust padding as needed


//            Text("Saved Quotes")
//                .font(.largeTitle)
//                .padding()
            Text("Saved Quotes")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            if savedQuotes.isEmpty {
                Text("No saved quotes yet.")
                    .font(.headline)
                    .padding()
            } else {
                List(savedQuotes, id: \.text) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.text)
                            .font(.title2)
                            .padding(.bottom, 5)
                        
                        Text("- \(quote.author)")
                            .font(.subheadline)
                            .italic()
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true) // Hide the default navigation bar
        .padding()
    }
}

#Preview {
    QuoteCollectionsView(savedQuotes: [("You are capable of amazing things.", "Unknown")])
}
