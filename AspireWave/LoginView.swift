//
//  LoginView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/29/24.
//

import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var navigateToIntroMessage = false
    
    
    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.beige, .cream, .lightBlue, .lightPink, .lightPurple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .blur(radius: 10)
            .ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                
                Text("What is your name?")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .italic()
                    .padding(.bottom, 20)
                
                TextField("Name", text: $name, onCommit: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                                            navigateToIntroMessage = true
                                        }
                                })
                                .padding(.vertical, 10)
                                .background(Color.clear)
                                .overlay(
                                    Rectangle()
                                        .padding(.trailing)
                                        .frame(width: 150, height: 1.5)
                                        .foregroundColor(Color.purple),
                                    alignment: .bottomLeading
                                )
                                .padding(.horizontal)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                                            navigateToIntroMessage = true
                                        }
                    }) {
                        HStack {
                            Text("Continue")
                            Image(systemName: "arrow.right")
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.orange, .yellow, Color.white.opacity(0.6)]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                                .cornerRadius(10)
                        )
                        .foregroundColor(.black)
                    }
                    .padding(.top, 20)
            }
            .padding()
            .navigationBarHidden(true)  // Hide navigation bar
            .fullScreenCover(isPresented: $navigateToIntroMessage) {
                IntroMessageView(name: name)
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    LoginView()
}
