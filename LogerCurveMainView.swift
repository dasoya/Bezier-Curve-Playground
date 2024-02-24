//
//  LogerCurveMainView.swift
//  2024challenge
//
//  Created by dasoya on 2/22/24.
//

import SwiftUI

struct LongerCurveMainView: View {
    
    @State var stepIndex = 0
    
    var body: some View {
        
        VStack{
            LongerCurveView()
                .frame(width:UIScreen.main.bounds.width/1.4)
              
            switch stepIndex {
                case 0:
                Text("In a 2D vector art program like Adobe Illustrator when you make a longer curve it's actually made from many small 4 point curves like this.\n \n By default most apps lock the control points around a shared start/end point and make sure they are always opposite relative to the shared point.")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                  
                case 1:
                Text("Notice the curve made by P1,P2,P3,P4 is a separate curve from the one made by P4,P5,P6,P7. It's just when P3 and P5 are on exact opposite sides of P4 together they look like one continuous curve. Most apps will then usually give you the option to stop locking them together so you can get a sharp corner. Un-check the lock checkbox then drag P3 or P5 and it will become even more clear they are separate curves.")
                    .font(.title3)
                    //.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
        
                    
                default:
                    Text("")
            }
          
            
          
            
        }
    }
}

#Preview {
    LongerCurveMainView()
}
