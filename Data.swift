//
//  Data.swift
//  2024challenge
//
//  Created by dasoya on 2/21/24.
//

import Foundation

struct Section {
    var id:Int
    var name:String
    var icon:String
}

let sections:[Section] = [
    .init(id: 0, name: "Welcome", icon: "hand.wave"),
    .init(id: 1, name: "De Casteljau's algorithm", icon: "brain.head.profile"),
    .init(id: 2, name: "A Longer Curve", icon: "point.topleft.down.curvedto.point.bottomright.up"),
    .init(id: 3, name: "3D Bezier Curves", icon: "cube"),
    .init(id: 4, name: "Playground", icon: "balloon.2"),
    
]

let controlPoints: [CGPoint] = [
    
    CGPoint(x: 100, y: 200),
    CGPoint(x: 400, y: 50),
    CGPoint(x: 500, y: 300)
    
]


let bollingPins: [CGPoint] = [
    
    CGPoint(x: 44, y: 371),
    CGPoint(x: 62, y: 338),
    CGPoint(x: 63, y: 305),
    CGPoint(x: 59, y: 260),
    CGPoint(x: 55, y: 215),
    CGPoint(x: 22, y: 156),
    CGPoint(x: 20, y: 128),
    CGPoint(x: 18, y: 100),
    CGPoint(x: 31, y: 77),
    CGPoint(x: 36, y: 47),
    CGPoint(x: 41, y: 17),
    CGPoint(x: 39, y: 0),
    CGPoint(x: 0, y: 0)
]


let array1: [(CGFloat, CGFloat)] = [(385.0, 464.0), (250.0, 50.0), (754.0, 360.0), (377.0, 228.5), (0.0, 97.0), (550.0, 450.0), (873.0, 225.5)]
let array2: [(CGFloat, CGFloat)] = [(385.5, 464.0), (36.0, 199.0), (121.5, 4.5), (361.5, 174.5), (601.5, 344.5), (550.0, 450.0), (871.0, 64.5)]
let array3: [(CGFloat, CGFloat)] = [(3.0, 340.5), (622.5, 11.0), (659.0, 141.0), (464.5, 353.5), (270.0, 566.0), (614.0, 450.0), (0.0, 339.0)]

