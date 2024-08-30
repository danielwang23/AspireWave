//
//  ContentView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/25/24.
//

import SwiftUI

struct HomeView: View {
    @State private var quoteOfTheDay = "You are doing your best."
    
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
    HomeView()
}
