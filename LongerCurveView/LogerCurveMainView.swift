//
//  LogerCurveMainView.swift
//  2024challenge
//
//  Created by dasoya on 2/22/24.
//

import SwiftUI

struct LongerCurveMainView: View {
    
    @Binding var stepIndex : Int
    
    var body: some View {
        
        VStack{
           
            
            LongerCurveView()
                .frame(width:UIScreen.main.bounds.width/1.4)
            
            switch stepIndex {
                case 0:
                
                Text("Now you can move control points! How to make a longer curve?")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top,50)
                    .overlay {
                        Text("move")
                            .highlight()
                            .position(CGPoint(x: 251.0, y: 73.0))
                    }
                
                Text("In a 2D vector art program like Adobe Illustrator when you make a longer curve it's actually made from many small 4 point curves like this. By default most apps lock the control points around a shared point and make sure they are always opposite relative to the shared point.")
                    .font(.title2)
                    //.fontWeight(.semibold)
                    .frame(width: 900)
                    .padding()
                    
                  
                case 1:
                Text("Notice the curve made by P1,P2,P3,P4 is a separate curve from the one made by P4,P5,P6,P7. It's just when P3 and P5 are on exact opposite sides of    P4 together they look like one continuous curve. Most apps will then usually give you the option to stop locking them together so you can get a sharp corner. Un-check     the lock checkbox then drag P3 or P5 and it will become even more clear they are separate curves.")
                    .font(.title2)
                    //.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top,50)
                    .frame(width: 850)
                    .overlay {
                        Text("Un-check")
                            .font(.title2)
                            .highlight()
                            .position(CGPoint(x: 560.0, y: 150.0))
                    }
                    .overlay {
                        Text("P4")
                            .font(.title2)
                            .highlight()
                            .position(CGPoint(x: 670.0, y: 90.0))
                    }
        
                    
                default:
                    Text("")
            }
          
          
          
            
        }
    }
}

