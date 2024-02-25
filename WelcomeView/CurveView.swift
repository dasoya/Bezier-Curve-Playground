//
//  CurveView.swift
//  2024challenge
//
//  Created by dasoya on 2/24/24.
//

import SwiftUI

struct CurveView: View {
    let utility = Utility()
    
    @Binding var controlPoints: [CGPoint]
        
    var BezierCurvePoints: [CGPoint] {
        
        let controlPoints1 : [CGPoint] = Array(controlPoints.prefix(4))
        return utility.getPointsOnBezierCurve(points: controlPoints1, numPoints: 50)
    }
    
    var BezierCurvePoints2: [CGPoint] {
        
        let controlPoints2 : [CGPoint] = Array(controlPoints[3..<7])
        return utility.getPointsOnBezierCurve(points: controlPoints2, numPoints: 50)
    }
    
    
    var totalBezierCurvePoints: [CGPoint] {
        
        return BezierCurvePoints + BezierCurvePoints2
        
    }
    
    @State var drawPath = 0.0
    @State private var isLocked: Bool = true
    @State private var ishidden: Bool = true
    @State private var isAnimating: Bool = false
    @State private var isPathAnimating: Bool = false
    @State private var isFirstAnimating: Bool = false
    
    let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing)
    
    func disappear(){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            drawPath = 0
            isAnimating = true
            isFirstAnimating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            isAnimating = false
            isFirstAnimating = false
        }
    }
    
    var body: some View {
        
        ZStack{
            
            ForEach(0..<7) { index in
                
                ZStack{
                    
                    Circle()
                        .frame(width: 18,height: 18)
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .foregroundColor(.gray)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .gesture(
                            
                            DragGesture()
                                .onChanged ({ (value) in
                                    let proposedPosition = value.location
                                    let safePosition = utility.clampPosition(proposedPosition)
                                    self.controlPoints[index] = safePosition
                                    
                                    if isLocked && index == 2 {
                                        self.controlPoints[4] =  utility.findSymmetricPoint(from:    self.controlPoints[2], to: self.controlPoints[3])
                                    }
                                    if isLocked {
                                        self.controlPoints[2] =  utility.findSymmetricPoint(from:    self.controlPoints[4], to: self.controlPoints[3])
                                    }
                                    
                                    
                                })
                        )
                    
                    Text("P\(index+1)")
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .offset(x: 20, y: -20)
                        .foregroundColor(.black)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                }
                
            }.opacity(ishidden ? 0 : 1)
            
            //Paths between points
            GeometryReader { geometry in
                
                
                Path { path in
                    path.move(to: controlPoints[0])
                    for point in controlPoints.dropFirst() {
                        path.addLine(to: point)
                    }
                    
                    
                }
                .stroke(.gray, lineWidth: 2)
                .opacity(ishidden ? 0 : 1)
                .frame(width: geometry.size.width, height: geometry.size.height)
              
                
                //A Long Curve for animating
                Path { path in
                    path.move(to: totalBezierCurvePoints[0])
                    for point in totalBezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .trim(from: 0, to: drawPath)
                .stroke(gradient, lineWidth: 4)
                .animation(.easeInOut(duration: 3).delay(0.4), value: drawPath)
                .frame(width: geometry.size.width, height: geometry.size.height)
               
               
               
            }.onAppear{
                
              
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.ishidden = true
                    drawPath = 1
                    isAnimating = true
                    isFirstAnimating = true
                }
//
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                    isAnimating = false
                    isFirstAnimating = false
                }
            }
            
            

        }
       
        
    }
}

