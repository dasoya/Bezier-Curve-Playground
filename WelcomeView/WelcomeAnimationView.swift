//
//  WelcomeAnimationView.swift
//  2024challenge
//
//  Created by dasoya on 2/23/24.
//

import SwiftUI

struct WelcomeAnimationView: View {
   
    @State var heartArray1 = array1.map { CGPoint(x: $0.0, y: $0.1) }
    @State var heartArray2 = array2.map { CGPoint(x: $0.0, y: $0.1) }
    @State var heartArray3 = array3.map { CGPoint(x: $0.0, y: $0.1) }
  
    
    var body: some View {
        ZStack{
          
            CurveView(controlPoints: $heartArray2)
            CurveView(controlPoints: $heartArray3)
            
            VStack{
                
                Text("Welcome to Curve World!")
                    .bold()
                    .font(.system(size: 100))
                Spacer()
                Text("How to make curves in Computer Graphics? ")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(width: 600)
               
                Text("\nExplore the De Casteljau's algorithm to generate Bezier curves. \nBezier curves are mathematical models used to create smooth curves by utilizing control points.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 600, alignment: .center)
                
                Text("\nPlease play in landscape mode.")
                    .font(.title3)
                    .frame(width: 600, alignment: .center)
                
                
            }.padding()
            
            CurveView(controlPoints: $heartArray1)
         
           
    
        }
    }
}

#Preview {
    WelcomeAnimationView()
}
