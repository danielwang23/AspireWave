//
//  IntroMessageView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/29/24.
//

import SwiftUI


struct IntroMessageView: View {
    var name: String
    
    var body: some View {
        Text("Welcome to the App, \(name)!")
            .font(.largeTitle)
            .padding()
        }
}

#Preview {
    IntroMessageView(name: "Preview User") //Preview user is just a place holder; Once a name is entered in LoginView it will display properly
}




