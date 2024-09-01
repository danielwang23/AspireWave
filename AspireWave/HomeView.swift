//
//  ContentView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/25/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = QuoteViewModel()
    @State private var isFavorite = false
    @State private var savedQuotes: [(text: String, author: String)] = []
    @State private var navigateToQuoteCollections = false
    
    @State private var hasNavigatedBack = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text(viewModel.quoteText)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("- \(viewModel.quoteAuthor)")
                    .font(.title2)
                    .padding(.top, 10)
                    .italic()
                
                Spacer()
                HStack {
                    Button(action: {
                        // Action for share button
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isFavorite.toggle()
                        if isFavorite {
                            saveQuote()
                        }
                        else {
                            removeQuote()
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(isFavorite ? .red : .primary)
                            .padding()
                            .background(Color.red.opacity(0.2))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: QuoteCollectionsView(savedQuotes: savedQuotes)
                        .onAppear {
                            // Ensure no quote fetch occurs on reappear after visiting the QuoteCollectionsView
                            hasNavigatedBack = true // Indicates navigating away
                        }
                        .onDisappear {
                            // Indicates navigated back when QuoteCollectionsView is dismissed
                            hasNavigatedBack = true
                        }) {
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                            .padding()
                            .background(Color.green.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 50)
                
                Spacer()
                
                Button(action: {
                    viewModel.fetchQuote()
                    isFavorite = false // Reset the heart when a new quote is fetched
                    hasNavigatedBack = false // Set this to false when fetching a new quote
                }) {
                    Text("New Quote")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .onAppear {
                if !hasNavigatedBack {
                    viewModel.fetchQuote()
                }
                
            }
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
    private func saveQuote() {
           let quote = (text: viewModel.quoteText, author: viewModel.quoteAuthor)
           savedQuotes.append(quote)
       }

    private func removeQuote() {
            savedQuotes.removeAll { $0.text == viewModel.quoteText && $0.author == viewModel.quoteAuthor }
        }
}

#Preview {
    HomeView()
}
