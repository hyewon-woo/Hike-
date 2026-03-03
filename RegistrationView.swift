//
//  RegistrationView.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/23/25.
//  Meant to work together with LoginView.
//

import SwiftUI

struct RegistrationView: View {
    //storing user inputs below.
    @State private var username = ""
    @State private var password = ""
    @State private var registrationFailed = false // regiatration failure
    @State private var registrationMessage = "" // comment for attempted registration
    @State private var isRegistered = false // registration status
    @State private var userNameFromServer = ""
    
    var body: some View {
        NavigationStack { // Use NavigationStack instead of NavigationView
            // originally created NavigationView, but it created errors due to redelaring issues.
            // Apple developer webseite suggests the usage of NavigationView on their tutorial demo app "ToDoDate"
            VStack {
                Text("Create an Account")
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
                
                if registrationFailed {
                    Text("Registration Failed: \(registrationMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    registerUser(userName: username, password: password) { success, message, userName in
                        if success {
                            userNameFromServer = userName // Save username from server
                            isRegistered = true // Mark as successfully registered
                        } else {
                            registrationFailed = true
                            registrationMessage = message
                        }
                    }
                }) {
                    Text("Register")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
              
                NavigationLink(value: userNameFromServer) {
                    EmptyView()
                }
            }
            
            // leades to login view after the account has been created.
            .navigationDestination(for: String.self) { value in
                LoginView()
            }
        }
    }
    
    // /registration function is created below.
    func registerUser(userName: String, password: String, completion: @escaping (Bool, String, String) -> Void) {
        //flask server as url is coded.
        let url = URL(string: "http://localhost:5000/register")!
        
        // requesting POST json to to the server. 
        let userRegistration = UserLogin(user: userName, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        //displayed error messages.
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(userRegistration)
            request.httpBody = jsonData
        } catch {
            print("Error encoding user data: \(error)")
            completion(false, "Encoding error", "")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(false, "Network error: \(error.localizedDescription)", "")
                }
                return
            }
            
            
            //displaying the status of registration process.
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                    DispatchQueue.main.async {
                        // Successful registration, pass true to the completion handler
                        completion(true, "Registration successful!", loginResponse.user)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(false, "Registration failed or server error", "")
                    }
                }
            }
        }
        
        task.resume()
    }
}
