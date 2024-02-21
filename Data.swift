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

