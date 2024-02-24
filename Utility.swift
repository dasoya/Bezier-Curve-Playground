//
//  Utility.swift
//  2024challenge
//
//  Created by dasoya on 2/11/24.
//

import Foundation
import SwiftUI

struct Utility{
    
    func clampPosition(_ position: CGPoint) -> CGPoint {
        var x = position.x
        var y = position.y

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        x = max(0, min(x, screenWidth))
        
        y = max(0, min(y, screenHeight))

        return CGPoint(x: x, y: y)
    }
    
    func findSymmetricPoint(from pointA: CGPoint, to pointB: CGPoint) -> CGPoint {

        _ = CGPoint(x: (pointA.x + pointB.x) / 2, y: (pointA.y + pointB.y) / 2)

        let vectorAB = CGPoint(x: pointB.x - pointA.x, y: pointB.y - pointA.y)
        
        let symmetricPoint = CGPoint(x: pointA.x + 2 * vectorAB.x, y: pointA.y + 2 * vectorAB.y)
        
        return symmetricPoint
    }

    
    func getPointOnBezierCurve(points : [CGPoint], t: CGFloat) -> CGPoint {
        
        var points = points
        
        
        
        while points.count > 1 {
            var newPoints = [CGPoint]()
            
            for i in 0..<points.count - 1 {
                let point1 = points[i]
                let point2 = points[i + 1]
                let newX = (1 - t) * point1.x + t * point2.x
                let newY = (1 - t) * point1.y + t * point2.y
                newPoints.append(CGPoint(x: newX, y: newY))
            }
            
            points = newPoints
            
        }
        
        return points[0]
      
    }
    
    
    func deCasteljau(points: [CGPoint], t: CGFloat) -> [[CGPoint]] {
        var points = points
        
        var result = [[CGPoint]]()
        
        result.append(points)
        
        while points.count > 1 {
            var newPoints = [CGPoint]()
            
            for i in 0..<points.count - 1 {
                let point1 = points[i]
                let point2 = points[i + 1]
                let newX = (1 - t) * point1.x + t * point2.x
                let newY = (1 - t) * point1.y + t * point2.y
                newPoints.append(CGPoint(x: newX, y: newY))
            }
            
            points = newPoints
            
            result.append(points)
        }
        
        return result
    }
    
    func getPointsOnBezierCurve(points: [CGPoint], numPoints: Int) -> [CGPoint] {
        var cpoints = [CGPoint]()
        
        for i in 0..<numPoints {
            let t = CGFloat(i) / CGFloat(numPoints - 1)
            cpoints.append(getPointOnBezierCurve(points: points, t: t))
        }
        
        return cpoints
    }
}



struct PointWrapper: Hashable {
    let x: CGFloat
    let y: CGFloat
    
   // let point: CGPoint
    
    init(_ point: CGPoint) {
       // self.point = point
        self.x = point.x
        self.y = point.y
    
    }
}


extension Text {
    func highlight() -> some View {
        self
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 3, leading: 9, bottom: 3, trailing: 9))
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
            )
            
    }
}
