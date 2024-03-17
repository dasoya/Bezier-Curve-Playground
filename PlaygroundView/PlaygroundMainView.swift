//
//  PlaygroundMainView.swift
//  2024challenge
//
//  Created by dasoya on 2/26/24.
//

import SwiftUI

struct PlaygroundMainView: View {
    
    let maxCurves = 5
    @State var focusedIndex = 0
    @State var numOfcurves = 1
    @State var isAnimating = false
    @State var curveViews : [PlaygroundView] = []
    
    
    var body: some View {
  
        ZStack{
            
            ForEach(0..<self.numOfcurves, id: \.self){ index in
                
                PlaygroundView(isFocused : self.focusedIndex == index, index: index, isAnimated: $isAnimating)
                    .zIndex(self.focusedIndex == index ? 1 : 0)
                
            }
            
    
            VStack(spacing:20){
                
                ForEach(0..<self.numOfcurves, id: \.self){ index in
                    
                    Button{
                        self.focusedIndex = index
                    } label: {
                        RoundedRectangle(cornerRadius: 5.0)
                        
                            .strokeBorder(index==self.focusedIndex ? .blue : .black, lineWidth : 4)
                            .frame(width: 40,height: 40)
                        
                        
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .overlay{
                                Text("\(index + 1)")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(index==self.focusedIndex ? .blue :.black)
                            }
                    }
                    
                }
                
                
                Button{
                    if(self.maxCurves > self.numOfcurves){
                        self.numOfcurves += 1
                    }
                } label: {
                    
                    RoundedRectangle(cornerRadius: 5.0)
                        .strokeBorder(.black, lineWidth : 4)
                        .frame(width: 40,height: 40)
                    
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .overlay{
                            Text("+")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.blue)
                        }
                    
                }
                
            }.position(x: 50,y: UIScreen.main.bounds.size.height - 500)
        }
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                Spacer()
            }
                              
            
        }
        
    }
}

