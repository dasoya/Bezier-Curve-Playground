//
//  BezierTutorialView.swift
//  2024challenge
//
//  Created by dasoya on 2/21/24.
//

import SwiftUI

struct BezierTutorialView: View {
    
    let utility = Utility()
    
    @Binding var stepIndex : Int
    @State var t: CGFloat = 0.0 // Parameter t
    
    var resultPoint: [[CGPoint]] {
        utility.deCasteljau(points: controlPoints, t: t)
    }
    
    var BezierCurvePoints: [CGPoint] {
        utility.getPointsOnBezierCurve(points: controlPoints, numPoints: 50)
    }
    
    let colors: [Color] = [.gray, .green,.blue]
    
    let pointsName = ["P","Q","R",""]
    @State var show : [CGFloat] = [0.0,0.0,0.0,0.0]
    
    var body: some View {
        
        ZStack{
            
            VStack{
           
                Slider(t: $t)
                    .opacity(self.stepIndex > 0 ? 1 : 0)
                    .onChange(of: t) { newValue in
                              
                        if(self.stepIndex == 1){
                            self.stepIndex += 1
                        }
                    }
                    .padding(.top,200)
                    
            }
            
            ForEach(0..<controlPoints.count){ index in
                ForEach(resultPoint[index].map(PointWrapper.init), id: \.self) { p in
                    
                    ZStack{
                        
                        Circle()
                            .frame(width: 18,height: 18)
                            .position((CGPoint(x: p.x, y: p.y)))
                            .foregroundColor(self.colors[index])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        
                        Text("\(pointsName[index])")
                            .position((CGPoint(x: p.x, y: p.y)))
                            .offset(x: 20, y: -20)
                            .foregroundColor(self.colors[index])
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        
                    }.opacity(index == 0 && self.stepIndex >= index || (index>0 && self.stepIndex-1 >= index) ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5))
                   
                }
             
                GeometryReader { geometry in
                    
                    
                    Path { path in
                        path.move(to: resultPoint[index][0])
                        for point in resultPoint[index].dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    .trim(from: 0, to:show[index])
                    .stroke(self.colors[index], lineWidth: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(self.stepIndex > index ? 1 : 0)
                    .animation(.easeInOut(duration: 2))
                    .onAppear(){
                        self.show[index] = 1
                    }
                }
            }
            
            GeometryReader { geometry in
                Path { path in
                    path.move(to: BezierCurvePoints[0])
                    for point in BezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(colors[2], lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .opacity(self.stepIndex >= 4 ? 1 : 0)
                .animation(.easeInOut(duration: 0.5))
            }
            
            
            
        }
    }
}

