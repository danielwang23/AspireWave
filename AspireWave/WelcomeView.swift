//
//  WelcomeView.swift
//  AspireWave
//
//  Created by Daniel Wang on 8/29/24.
//

import SwiftUI

extension Color {
    static let cream = Color(red: 1.0, green: 0.98, blue: 0.88)
    static let lightBlue = Color(red: 0.68, green: 0.85, blue: 0.90)
    static let lightPink = Color(red: 1.0, green: 0.71, blue: 0.76)
    static let lightPurple = Color(red: 0.85, green: 0.72, blue: 0.90)
    static let beige = Color(red: 0.96, green: 0.96, blue: 0.86)
}

struct WelcomeView: View {
    @State private var isAnimating = false
    @State private var navigateToLogin = false
    @State private var rippleEffect = false
    
    var body: some View {
        ZStack{
            // Background with moving flow of colors
            
//            AngularGradient(gradient: Gradient(colors: [.beige, .cream, .lightBlue, .lightPink, .lightPurple]), center: .center)
//                .hueRotation(.degrees(isAnimating ? 360 : 0))
//                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: isAnimating)
//                .ignoresSafeArea()
//                .onAppear {
//                    withAnimation {
//                        self.isAnimating = true
//                    }
//                }
            
            LinearGradient(gradient: Gradient(colors: [.beige, .cream, .lightBlue, .lightPink, .lightPurple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .hueRotation(.degrees(isAnimating ? 360 : 0))  // Rotate colors to simulate the change
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimating)
                .ignoresSafeArea()
                .onAppear {
                    withAnimation {
                        self.isAnimating = true
                    }
                }
            
            // "Welcome" text with individual letter ripple effect
            Text("Welcome!")
                .font(.custom("Moontime", size: 80))  // Custom font similar to the image
                .foregroundColor(.purple)
                .shadow(color: .purple.opacity(0.7), radius: 10, x: 0, y: 0)
                .scaleEffect(isAnimating ? 1.15 : 0.8)
                .blur(radius: isAnimating ? 0 : 10)
                .animation(Animation.easeOut(duration: 2), value: isAnimating)
                .opacity(0.8)
                .onAppear {
                    withAnimation {
                        self.isAnimating = true
                    }
                }
            .onAppear {
                withAnimation {
                    self.rippleEffect = true
                }
            }
            
            // Ripple effect on tap
            if rippleEffect {
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimating ? 3 : 0)
                    .opacity(isAnimating ? 0 : 1)
                    .animation(Animation.easeOut(duration: 0.4), value: isAnimating)
            }
        }
        .contentShape(Rectangle()) // Make entire area tappable
        .onTapGesture {
            withAnimation {
                self.isAnimating.toggle()
                self.rippleEffect = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.navigateToLogin = true
            }
        }
        .fullScreenCover(isPresented: $navigateToLogin) {
            LoginView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
