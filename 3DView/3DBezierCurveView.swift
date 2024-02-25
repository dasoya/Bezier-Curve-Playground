//
//  3DBezierCurveView.swift
//  2024challenge
//
//  Created by dasoya on 2/24/24.
//

import SwiftUI

struct Bezier3DCurveView: View {
    
    @State var numberOfViews : Int = 60
    @State var endAngle : Int = 360
    
    
    @State var array1 = Array(bollingPins.prefix(7))
    @State var array2 = Array(bollingPins.suffix(7))
    @State var pointsList = [CGPoint]()
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var accumulatedAngleX: Double = 0
    @State private var accumulatedAngleZ: Double = 0
    
    @State var maxValue1  = 60
    @State var minValue1  = 1
    @State var name1 = "Divisions"
    
    @State var minValue2  = 0
    @State var maxValue2 = 360
    @State var name2 = "End Angle"
    
    var body: some View {
        ZStack{
            HStack{
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<self.numberOfViews, id: \.self) { index in
                            
                            ZStack{
                                curve3DView(controlPoints:$array1)
                                curve3DView(controlPoints:$array2)
                            
                            }
                            .offset(x: geometry.size.width / 2 , y: geometry.size.height/4)
                            .rotation3DEffect(.degrees((Double(self.endAngle) / Double(self.numberOfViews)) * Double(index)), axis: (x: 0, y: 1, z: 0))
                        
                            
                        }
                        
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height)}
                .gesture(
                    DragGesture()
                        .updating($dragOffset, body: { (value, dragInfo, _) in
                            dragInfo = value.translation
                        })
                        .onEnded({ (value) in
                            
                            
                            let distanceDragged = value.translation.width
                            let rotationAngle = distanceDragged/2
                            self.accumulatedAngleZ += Double(rotationAngle)
                            
                            
                            let distanceDraggedH = value.translation.height
                            let rotationAngleZ = distanceDraggedH/2
                            self.accumulatedAngleZ += Double(rotationAngleZ)
                            
                        })
                )
                .rotation3DEffect(.degrees(self.accumulatedAngleX), axis: (x: -1, y: 0, z: 0))
                .rotation3DEffect(.degrees(self.accumulatedAngleZ), axis: (x: 0, y: 0, z: -1))
                .padding(.bottom,200)
                
                Spacer()
                
                VStack{
                    SliderForInt(maxValue: $maxValue1,minValue: $minValue1,name: $name1, t: $numberOfViews)
                    SliderForInt(maxValue: $maxValue2,minValue: $minValue2,name: $name2, t: $endAngle)
                }.padding(.leading,-200)
                    .padding(100)
            }
        }
        Text("You can make a 3D object with many bezier Curves.\nPlay with the sliders to see how they effect the result!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
        
        
    }
    
    
    
    
}

#Preview{
    Bezier3DCurveView()
}
