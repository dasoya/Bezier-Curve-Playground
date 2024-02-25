//
//  LongerCurveView.swift
//  2024challenge
//
//  Created by dasoya on 2/21/24.
//

import SwiftUI

struct LongerCurveView: View {
    
    let utility = Utility()
    
    
    @State private var controlPoints: [CGPoint] = [
        
        CGPoint(x: 200, y: 350),
        CGPoint(x: 250, y: 50),
        CGPoint(x: 350, y: 100),
        CGPoint(x: 400, y: 250),
        CGPoint(x: 500, y: 50),
        CGPoint(x: 550, y: 450),
        CGPoint(x: 600, y: 150)
        
    ]
    
    
    
    var BezierCurvePoints: [CGPoint] {
        
        let controlPoints1 : [CGPoint] = Array(controlPoints.prefix(4))
        return utility.getPointsOnBezierCurve(points: controlPoints1, numPoints: 50)
    }
    
    var BezierCurvePoints2: [CGPoint] {
        
        
        let controlPoints2 : [CGPoint] = Array(controlPoints.suffix(from: 3))
        return utility.getPointsOnBezierCurve(points: controlPoints2, numPoints: 50)
    }
    
    
    @State var show : [CGFloat] = [0.0,0.0,0.0,0.0,0.0]
    @State private var isLocked: Bool = true
    
    var body: some View {
        
        ZStack{
            
            
            
            //Paths between points
            GeometryReader { geometry in
                
                
                Path { path in
                    path.move(to: controlPoints[0])
                    for point in controlPoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                
                .stroke(.gray, lineWidth: 2)
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            
            
            
            //First Bezier Curve
            GeometryReader { geometry in
                Path { path in
                    path.move(to: BezierCurvePoints[0])
                    for point in BezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(.orange, lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            
            //Second Bezier Curve
            GeometryReader { geometry in
                Path { path in
                    path.move(to: BezierCurvePoints2[0])
                    for point in BezierCurvePoints2.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(.pink, lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            
            //Control Points
            ForEach(0..<7){ index in
                
                ZStack{
                    
                    Circle()
                        .frame(width: 18,height: 18)
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .foregroundColor(index != 3 ? .gray : .blue)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .onAppear{
                            
                            self.controlPoints[4] =  utility.findSymmetricPoint(from:    self.controlPoints[2], to: self.controlPoints[3])
                            
                            self.controlPoints[5] =  utility.findSymmetricPoint(from:    self.controlPoints[1], to: self.controlPoints[3])
                            self.controlPoints[6] =  utility.findSymmetricPoint(from:    self.controlPoints[0], to: self.controlPoints[3])
                            
                            
                        }
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
                
            }
            
            
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                
                Toggle(isOn: $isLocked) {
                    Text("Lock P3 & P5")
                        .font(.title3)
                    
                }
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                .padding()
            }
        }
    }
}

#Preview {
    LongerCurveView()
}
