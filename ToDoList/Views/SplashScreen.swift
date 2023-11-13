//
//  SplashScreen.swift
//  ToDoList
//
//  Created by Aref on 11/13/23.
//
import SwiftUI

struct SplashScreen: View {
    // State variable to control the animation.
    @State private var isAnimating = false

    var body: some View {
        VStack {
            // Image view for the logo.
            // The frame size changes based on the animation state.
            Image(systemName: "book.pages.fill")
                .resizable()
                .scaledToFit()
                .frame(width: isAnimating ? 120 : 100, height: isAnimating ? 120 : 100)
                .foregroundColor(.white)
                // Scale effect to slightly increase the size during animation.
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                // Opacity changes from 0 to 1 to create a fade-in effect.
                .opacity(isAnimating ? 1.0 : 0.0)

            // Text view for the app name.
            // It also fades in based on the animation state.
            Text("Todo List")
                .font(.largeTitle)
                .foregroundColor(.white)
                .opacity(isAnimating ? 1.0 : 0.0)
        }
        // VStack fills the entire screen.
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue) // Blue background for the splash screen.
        .edgesIgnoringSafeArea(.all) // Extends the view to the edges of the screen.
        .onAppear {
            // Animation starts when the view appears.
            // It uses an ease-in-out style and lasts for 1 second.
            withAnimation(.easeInOut(duration: 1.0)) {
                isAnimating = true
            }
        }
    }
}


#Preview {
    SplashScreen()
}
