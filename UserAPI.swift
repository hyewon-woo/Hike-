//UserAPI.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/23/25.

// userAPI page was necessary in order to prevent conflicts and re-declaration of the login and login response from both registration and login view.

import Foundation

// Shared struct for user login and registration
struct UserLogin: Codable {
    let user: String
    let password: String
}

// Shared response structure for login and registration
struct LoginResponse: Codable {
    let user: String
    let userCount: Int
    let totalCount: Int
}

// Function to handle the login process //mirroed from login view.
func loginUser(userName: String, password: String, completion: @escaping (Bool, String, String) -> Void) {
    let url = URL(string: "http://localhost:5000/login")!
    
    let userLogin = UserLogin(user: userName, password: password)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(userLogin)
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
        
        if let data = data {
            do {
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                DispatchQueue.main.async {
                    // Successful login, pass true to the completion handler
                    completion(true, "Login successful!", loginResponse.user)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(false, "Invalid credentials or server error", "")
                }
            }
        }
    }
    
    task.resume()
}

// Function to handle the registration process //mirrrored from registration view. 
func registerUser(userName: String, password: String, completion: @escaping (Bool, String, String) -> Void) {
    let url = URL(string: "http://localhost:5000/register")! // Your Flask server URL
    
    let userRegistration = UserLogin(user: userName, password: password)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
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
