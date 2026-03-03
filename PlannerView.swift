//
//  StoryView.swift
//  HikeDemo
//
//  Created by Hyewon Woo on 1/13/25.
//  Application Development 2025 Jan
//  Referenced from https://developer.apple.com/tutorials/sample-apps/aboutme


// PlannerView with data below.
import SwiftUI


struct PlannerView: View {
    var body: some View {
        VStack {
            Text("My Planner")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.planner)
                    .font(.body)
                    .padding()
                
                Text("Are you traveling by yourself? If not, who are you traveling with?")
                    .multilineTextAlignment(.center)
                    .padding()
                    
                
        
            Text ("What is the purpose of this trip?")
                    .padding()
                 
            Text ("What is your budget?")
                    .padding()
            
        
                
        
            }
        }
        .padding([.top, .bottom], 50)
    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}
