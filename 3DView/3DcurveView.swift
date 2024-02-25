//
//  3DcurveView.swift
//  2024challenge
//
//  Created by dasoya on 2/25/24.
//

import SwiftUI

struct curve3DView: View {
  
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
        
        @State var drawPath = 1.0
        
    let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
        
        var body: some View {
            
            ZStack{
            
                
                GeometryReader { geometry in
                    
                    //A Long Curve
                    Path { path in
                        path.move(to:totalBezierCurvePoints[0])
                        for point in totalBezierCurvePoints.dropFirst() {
                            
                            
                            path.addLine(to: point)
                        }
                    }
                    .stroke(gradient, lineWidth: 4)
                    .frame(width: geometry.size.width, height: geometry.size.height)

                   
                }
                

            }
           
            
        }
    


}

