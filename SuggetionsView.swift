//
//  FunFactsView.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/13/25.
//Application Development 2025 Jan
//  Referenced from https://developer.apple.com/tutorials/sample-apps/aboutme


//SuggestionView with data below.
// planning to implement Open AI within this page.

import SwiftUI

struct SuggestionsView: View {

    @State private var suggestions = ""
    var body: some View {
        VStack {
            Text("Suggestions")
                .font(.largeTitle)
                .fontWeight(.bold)
                        
            Text("suggestions")
                .padding()
                .font(.title)
                .frame(minHeight: 400)

            Button("Suggestions for you") {
                suggestions = information.suggestions.randomElement()!
            }
        }
        .padding()
    }
}

struct SuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsView()
    }
}
