//
//  QuoteViewModel.swift
//  AspireWave
//
//  Created by Daniel Wang on 9/1/24.
//

import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteText: String = "Loading quote..."
    @Published var quoteAuthor: String = ""

    func fetchQuote() {
        guard let url = URL(string: "https://zenquotes.io/api/random") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                if let decodedResponse = try JSONDecoder().decode([Quote]?.self, from: data), let quote = decodedResponse.first {
                    DispatchQueue.main.async {
                        self.quoteText = quote.q
                        self.quoteAuthor = quote.a
                    }
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
        task.resume()
    }
}
