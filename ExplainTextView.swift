//
//  ExplainTextView.swift
//  2024challenge
//
//  Created by dasoya on 2/14/24.
//

import SwiftUI

struct ExplainTextView: View {
    
    @Binding var index : Int
    @State private var isVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            
            Text("Let's do it step by step.")
                .font(.title2)
                .fontWeight(.regular)
                
            
            HStack{
                Text("1️⃣ Here’s 3 points called")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text("control points")
                    .highlight()
                
            }
          
            Text("2️⃣ Pick a number between 0 and 1 \n (called t    ) with the slider where 0 = the beginning and 1 = the end.")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    //.lineLimit(1)
                    .overlay {
                        Text("t")
                            .highlight()
                            .position(CGPoint(x: 115.0, y: 50.0))
                    }
                    .opacity(self.index > 0 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: true)
                  

            Text("if t = .25 then we compute a point   25% of the way going from P1 to P2, and another 25% of the way going from P2 to P3.")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    //.lineLimit(1)
                    .overlay {
                        Text("25%")
                            .highlight()
                            .position(CGPoint(x: 475.0, y: 15.0))
                        
                    }
                    .opacity(self.index > 1 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: true)
            
            Text("3️⃣ Recursively, do the same for the resulting points. comput t    point \n between Q1    and Q2   .")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    //.lineLimit(1)
                    .overlay {
                        Text("t")
                            .highlight()
                            .position(CGPoint(x: 335.0, y: 55.0))
                        
                    }
                    .overlay {
                        Text("Q1")
                            .highlight()
                            .position(CGPoint(x: 150.0, y: 88.0))
                        
                    }
                    .overlay {
                        Text("Q2")
                            .highlight()
                            .position(CGPoint(x: 268.0, y: 88.0))
                        
                    }
                    .opacity(self.index > 2 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: true)
            
            Text("4️⃣ Finally the positions of that blue point make a curve.")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .opacity(self.index > 3 ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: true)
               
            
            
        }
    }
}

