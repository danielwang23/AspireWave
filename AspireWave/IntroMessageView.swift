//
//  IntroMessageView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/29/24.
//

import SwiftUI


struct IntroMessageView: View {
    var name: String
    @State private var navigateToHome = false
    @State private var isAnimating = false
    @State private var rippleEffect = false
    @State private var bounceEffect = false
    
    var body: some View {
        
        ZStack {
            if !navigateToHome {
                LinearGradient(gradient: Gradient(colors: [.beige, .cream, .lightBlue, .lightPink, .lightPurple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .blur(radius: 15)
                .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    
                    VStack {
                        Text("You are capable of amazing things,")
                            .font(.custom("Moontime", size: 60))  // Smaller text for the first part
                            .multilineTextAlignment(.center)
                        
                        Text(" \(name).")
                            .font(.custom("Moontime", size: 70))  // Larger text for the name
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.purple)
                    }
                    .padding()
                    
                    Spacer()
                    Text("Tap anywhere to continue")
                        .font(.footnote)
                        .padding()
                        .italic()
                        .scaleEffect(bounceEffect ? 0.8 : 0.9)
                        .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: bounceEffect)
                        .onAppear {
                            bounceEffect = true
                        }
                }
                .padding()
                
                if rippleEffect {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .scaleEffect(isAnimating ? 3 : 0)
                        .opacity(isAnimating ? 0 : 1)
                        .animation(Animation.easeOut(duration: 0.4), value: isAnimating)
                }
            }
            else{
                HomeView()
                    .transition(.opacity) // Apply fade transition
                    .animation(.easeInOut(duration: 2.0), value: navigateToHome)
                    .ignoresSafeArea()
            }
        }
        
        .onTapGesture {
            withAnimation {
                self.isAnimating.toggle()
                self.rippleEffect = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.easeInOut(duration: 1.0)) {
                    navigateToHome = true
                }
            }
        }
        
        
    }
}

#Preview {
    IntroMessageView(name: "Preview User") //Preview user is just a place holder; Once a name is entered in LoginView it will display properly
}
