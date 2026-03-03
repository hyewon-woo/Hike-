//
//  ContentView.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/7/25.
//  This is introductory page of the application.
//  Application Development 2025 Jan
//  Referenced from https://developer.apple.com/tutorials/sample-apps/aboutme

// Intro screen for app. 
import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, travelers!")
            Text("Welcome to Hike.")
                .bold()
        }
        .padding()
    }
}

#Preview {
    IntroView()
}
