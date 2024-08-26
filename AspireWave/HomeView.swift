//
//  ContentView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/25/24.
//

import SwiftUI

struct Homeview: View {
    @State private var quoteOfTheDay = "You are capable of amazing things, Daniel."
    
    var body: some View {
        VStack {
            Text(quoteOfTheDay)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            
            
        }
    }
}

#Preview {
    Homeview()
}
