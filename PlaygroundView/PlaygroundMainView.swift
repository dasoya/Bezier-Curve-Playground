//
//  PlaygroundMainView.swift
//  2024challenge
//
//  Created by dasoya on 2/26/24.
//

import SwiftUI

struct PlaygroundMainView: View {
    
    let maxCurves = 6
    @State var focusedIndex = 0
    @State var numOfcurves = 1
    @State var isAnimating = false
    @State var curveViews : [PlaygroundView] = []
    
    @ObservedObject var viewModel = PlaygroundViewModel()
//    func createPlaygroundView(isFocused: Bool) -> PlaygroundView {
//           let playgroundView = PlaygroundView(isFocused: isFocused, isAnimated: $isAnimating)
//        
//          curveViews.append(playgroundView)
//           //playgroundView.animate() // View 생성 후 함수 호출
//           return playgroundView
//       }
    
    func animatePlaygroundView() {
        
        for v in curveViews {
            
            v.animate()
            v.isAnimating = true
            v.ishidden = true
            v.drawPath = 0
            v.isFirstAnimating = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                v.isFirstAnimating = false
                v.drawPath = 1 }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                v.isAnimating = false
                v.ishidden = false
               v.isAnimated = false
           }
        }
           
           
    }
    
    
    var body: some View {
  
        ZStack{
            
            ForEach(0..<self.numOfcurves, id: \.self){ index in
                
                PlaygroundView(isFocused : self.focusedIndex == index, index: index, isAnimated: $isAnimating)
                
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
                    if(self.maxCurves >= self.numOfcurves){
                        self.numOfcurves += 1
//                        createPlaygroundView(isFocused : true)
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
                              
            ToolbarItem(placement: .bottomBar) {
                
            
                Button {
             
                    self.isAnimating = true
                   // animatePlaygroundView()
                    viewModel.isAnimating = true
                } label: {
                    Text("Animate")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 3, leading: 9, bottom: 3, trailing: 9))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                }
                
            }
            

            
        }
        
    }
}

