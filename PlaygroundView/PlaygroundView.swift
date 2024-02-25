//
//  PlaygroundView.swift
//  2024challenge
//
//  Created by dasoya on 2/23/24.
//

import SwiftUI

struct PlaygroundView: View {
    
    let utility = Utility()
    
    @ObservedObject  var viewModel = PlaygroundViewModel()
    
    @State private var controlPoints: [CGPoint] = [
        
        CGPoint(x: 200, y: 350),//0
        CGPoint(x: 250, y: 50),
        CGPoint(x: 350, y: 100),
        
        CGPoint(x: 400, y: 250), //2
        
        CGPoint(x: 500, y: 50), //3
        CGPoint(x: 550, y: 450),//4
        
        CGPoint(x: 600, y: 150),//5
        
        
    ]
    
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
    
    var isFocused : Bool
    var index : Int
    @Binding var isAnimated : Bool
    @State var drawPath = 1.0
    @State private var isLocked: Bool = true
    @State  var ishidden: Bool = false
    @State var isAnimating: Bool = false
    @State  var isFirstAnimating: Bool = false
    
    let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing)
    
    func animate(){
        
        if(self.isAnimated){
            self.ishidden = true
            self.drawPath = 0
            self.isAnimating = true
            self.isFirstAnimating = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                self.isFirstAnimating = false
                self.drawPath = 1 }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                self.isAnimating = false
                self.ishidden = false
                self.isAnimated = false
            }
        }
    }
    var body: some View {
        
        ZStack{
            GeometryReader { geometry in
                VStack{
                    Toggle(isOn: $isLocked) {
                        Text("Lock P3 & P5")
                            .font(.title3)
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    
                    Toggle(isOn: $ishidden) {
                        Text("Hide UI")
                            .font(.title3)
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                }.frame(width: 200)
                
                    .position(x: geometry.size.width - 150 ,y: 25)
            }
            
            ForEach(0..<7) { index in
                
                ZStack{
                    
                    Circle()
                        .frame(width: 18,height: 18)
                        .position((CGPoint(x: controlPoints[index].x, y: controlPoints[index].y)))
                        .foregroundColor(.gray)
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
                
            }.opacity(ishidden ? 0 : 1)
                .opacity(isFocused ? 1 : 0)
            
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
                
            }.opacity(ishidden ? 0 : 1)
                .opacity(isFocused ? 1 : 0)
            
            GeometryReader { geometry in
                
                //A Long Curve for animating
                Path { path in
                    path.move(to: totalBezierCurvePoints[0])
                    for point in totalBezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .trim(from: 0, to: drawPath)
                .stroke(gradient, lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .animation(.easeInOut(duration: 2).delay(0.4), value: isFirstAnimating)
                .opacity(isAnimating ? 1 : 1)
                
                
                
                //First Bezier Curve
                
                Path { path in
                    path.move(to: BezierCurvePoints[0])
                    for point in BezierCurvePoints.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(.black, lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .opacity(isAnimating ? 0 : 1)
                .opacity(isFocused ? 1 : 0)
                
                //Second Bezier Curve
                Path { path in
                    path.move(to: BezierCurvePoints2[0])
                    for point in BezierCurvePoints2.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(.black, lineWidth: 4)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .opacity(isAnimating ? 0 : 1)
                .opacity(isFocused ? 1 : 0)
            }
            
            
            
            
        }
        .onAppear{
             animate()
        }
        .toolbar{
            
//                        ToolbarItem(placement: .bottomBar) {
//                            Spacer()
//                        }
            
                        ToolbarItem(placement: .bottomBar) {
            
            
                            Button {
                                self.ishidden = true
                                drawPath = 0
                                isAnimating = true
                                isFirstAnimating = true
            
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                                    isFirstAnimating = false
                                    drawPath = 1 }
            
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                                    isAnimating = false
                                    self.ishidden = false
                                }
            
                            } label: {
                                Text("Animate \(index+1)")
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

