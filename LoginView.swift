//
//  Login.swift
//  HikeDemo
//  Last updated by Hyewon Woo on 1/13/25.
//  Created by Hyewon Woo on 1/7/25.
//  Course: 2025 Jan term App development
//  Help from peer Reece accessed regarding implementing action for buttons.
//  citation: "How to Build an App in 8 days" by CodeWithChris https://learn.codewithchris.com/courses/start?utm_source=youtube&utm_medium=channel&utm_content=link
//  "Why Not Try" by OxTim https://github.com/0xTim/swift-org-swiftui-tutorial
// Both Source above accessed for basic understanding of swift language, and references.

// Log in info screen.
// Last motified by Hyewon Woo on 1/23/25.

import SwiftUI

// Login View: User can log in with a username and password
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var loginFailed = false
    @State private var loginMessage = ""
    @State private var loggedIn = false
    @State private var userNameFromServer = ""
    
    // State to navigate to ContentView once login is successful
    @State private var navigateToContentView = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Please log in to your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .border(Color.gray)
                    .cornerRadius(5)
                
                SecureField("Password", text: $password)
                    .padding()
                    .border(Color.gray)
                    .cornerRadius(5)
                
                if loginFailed {
                    Text("Login Failed: \(loginMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                // NavigationLink is now wrapping the button
                NavigationLink(
                    destination: ContentView(username: userNameFromServer),
                    isActive: $navigateToContentView
                ) {
                    Button(action: {
                        // Call the login function when the button is pressed
                        loginUser(userName: username, password: password) { success, message, userName in
                            if success {
                                // On success, set the username and trigger navigation
                                userNameFromServer = userName
                                loggedIn = true
                                navigateToContentView = true // This triggers the navigation
                            } else {
                                // On failure, show the error message
                                loginFailed = true
                                loginMessage = message
                            }
                        }
                    }) {
                        Text("Log In")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
            }
            .padding()
        }
    }
    
    // Function to simulate a login request
    func loginUser(userName: String, password: String, completion: @escaping (Bool, String, String) -> Void) {
        // Simulate a successful login (replace with actual networking code)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if userName == "test" && password == "password123" {
                completion(true, "Login successful!", "testUser")
            } else {
                completion(false, "Invalid credentials", "")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
