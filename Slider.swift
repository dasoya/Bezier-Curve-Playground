//
//  Slider.swift
//  2024challenge
//
//  Created by dasoya on 2/10/24.
//

import SwiftUI

struct Slider: View {
    
    @State var width : CGFloat = 0
    let totalWidth = 400.0 
    let padding = UIScreen.main.bounds.width - 400.0 //60
    
    
    @Binding var t : CGFloat;
    

       init(t: Binding<CGFloat>) {
           self._t = t
       }
    
    var body: some View {
        
        VStack{
            
            Text("t \(self.getValue(val: t))")
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
                                        t = self.width/self.totalWidth
                                    }                                })
                        )
                    
                }
            }
        }.padding(30)
        
    }
    
    func getValue(val: CGFloat)->String{
        return String(format: "%.2f",val)
    }
}

//#Preview {
//    @State var t: CGFloat = 0
//    Slider(t: $t)
//}
