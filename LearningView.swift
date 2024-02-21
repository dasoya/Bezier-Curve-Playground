//
//  LearningView.swift
//  2024challenge
//
//  Created by dasoya on 2/21/24.
//

import SwiftUI
import CoreGraphics

struct LearningView: View {
    
    @State var stepIndex = 0
    @State private var tappable: Bool = true
    
    var body: some View {
        
        HStack{
            
            VStack{
                
                BezierTutorialView(stepIndex : self.$stepIndex)
                    .frame(width:UIScreen.main.bounds.width/2)
                    .padding(.top,150)
                
               Text("Try Sliding!")
                   .font(.title)
                   .padding(.top,-100)
                   .padding(.bottom,100)
                   .opacity(self.stepIndex == 1 ? 1 : 0)
                
            }
            
            ExplainTextView(index: $stepIndex)
            
            
        }.padding(.trailing,20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                
                if(self.tappable&&self.stepIndex != 1){
                    stepIndex += 1
                }
                
                //self.tappable = false
            }
        
    }
    
}




    
