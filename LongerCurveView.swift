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
        
        CGPoint(x: 100, y: 200),
        CGPoint(x: 200, y: 100),
        CGPoint(x: 400, y: 50),
        CGPoint(x: 500, y: 300)
        
    ]
    
    var BezierCurvePoints: [CGPoint] {
        utility.getPointsOnBezierCurve(points: controlPoints, numPoints: 50)
    }
    

    @State var show : [CGFloat] = [0.0,0.0,0.0,0.0,0.0]
    
    var body: some View {
        
        ZStack{
            
            //Controll PointscontrolPoints.map(PointWrapper.init)
            ForEach(0..<4) { index in
                
                ZStack{
                    
                    Circle()
                        .frame(width: 18,height: 18)
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .foregroundColor(.gray)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .gesture(
                            
                            DragGesture()
                                .onChanged ({ (value) in
                                    
                                    //let index = self.controlPoints.firstIndex(of: CGPoint(x:p.x,y:p.y))
                                    self.controlPoints[index] = value.location
                            
                                    
                        })
                        )
                    
                    Text("P\(index+1)")
                   // Text("P\(controlPoints.firstIndex(of: CGPoint(x:p.x,y:p.y))! + 1)")
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .offset(x: 20, y: -20)
                        .foregroundColor(.black)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                }
            }
            
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
                
             
                
            //Bezier Curve
            GeometryReader { geometry in
                Path { path in
                    path.move(to: BezierCurvePoints[0])
                    for point in BezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(.orange, lineWidth: 2)
                .frame(width: geometry.size.width, height: geometry.size.height)
            
            }
            
            
            
        }
    }
}

#Preview {
    LongerCurveView()
}
