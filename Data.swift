//
//  Data.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/13/25.
//  Application Development 2025 Jan
//  Referenced from https://developer.apple.com/tutorials/sample-apps/aboutme


import Foundation
import SwiftUI

// strings are declared below.
struct Info {
    let image: String
    let name: String
    let planner: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let suggestions: [String]
}

// texts per strings are given below. 
let information = Info(
    
    image: "Placeholder",
    name: "Victoria",
    planner: "Let's plan your trips!",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    suggestions:[
        "Beautiful hikes in Japan.",
        "Shopping sights in South Korea.",
        "Magnificat trail walk in China",
        "Tea making experience in India",
        "Ice skating in Russia",
        "Great northern lights in Norway",
        "A collection of historic builidngs in New York City.",
        "White castles in Germany.",
    ]
)
