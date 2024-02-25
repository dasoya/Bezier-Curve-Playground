//
//  SliderForAngle.swift
//  2024challenge
//
//  Created by dasoya on 2/25/24.
//

import SwiftUI

struct SliderForInt: View {
    @State var width : CGFloat = 400.0
    let totalWidth = 400.0
    let padding = UIScreen.main.bounds.width - 400.0 //60
    @Binding var maxValue : Int;
    @Binding var minValue : Int;
    @Binding var name : String;
    
    @Binding var t : Int;
    
    var body: some View {
        
        VStack{
            
            Text("\(name) \(t)")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            ZStack(alignment: .leading){
                
                Rectangle()
                    .fill(Color.black.opacity(0.20))
                    .frame(width: totalWidth, height: 6)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: self.width, height: 6)
                
                HStack{
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.width)
                        .gesture(
                            
                            DragGesture()
                                .onChanged ({ (value) in
                                    
                                    var x = value.location.x
                                    
                                    if x >= 0 && x <= self.totalWidth {
                                        
                                        if x < 5 {x = 0}
                                        else if (x > self.totalWidth - 5) {x = self.totalWidth}
                                        
                                        self.width = x
                                        self.t = Int(minValue) + Int(self.width/self.totalWidth * Double(self.maxValue-self.minValue))
                                                
                                    }                                })
                        )
                    
                }
            }
        }.padding(30)
        
    }

}
