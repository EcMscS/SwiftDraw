//
//  DOM.Path2.swift
//  SwiftVG
//
//  Created by Simon Whitty on 8/3/17.
//  Copyright © 2017 WhileLoop Pty Ltd. All rights reserved.
//

import Foundation

extension DOM {
    
    class Path2: GraphicsElement {
        
        // segments[0] is always a .move
        var segments: [Segment]
        
        init(x: Coordinate, y: Coordinate) {
            let s = Segment.move(x: x, y: y, space: .absolute)
            segments = [s]
            super.init()
        }
        
        enum Segment {
            case move(x: Coordinate, y: Coordinate, space: CoordinateSpace)
            case line(x1: Coordinate, y1: Coordinate,
                      x2: Coordinate, y2: Coordinate, space: CoordinateSpace)
            case horizontal(x: Coordinate, space: CoordinateSpace)
            case vertical(y: Coordinate, space: CoordinateSpace)
            case cubic(x: Coordinate, y: Coordinate,
                      x1: Coordinate, y1: Coordinate,
                      x2: Coordinate, y2: Coordinate, space: CoordinateSpace)
            case cubicSmooth(x: Coordinate, y: Coordinate,
                             x2: Coordinate, y2: Coordinate, space: CoordinateSpace)
            case quadratic(x: Coordinate, y: Coordinate,
                          x1: Coordinate, y1: Coordinate, space: CoordinateSpace)
            case quadraticSmooth(x: Coordinate, y: Coordinate, space: CoordinateSpace)
            case arc(x: Coordinate, y: Coordinate,
                     rx: Coordinate, ry: Coordinate,
                     rotate: Coordinate, large: Bool,
                     sweep: Bool, space: CoordinateSpace)
            case close
            
            enum CoordinateSpace {
                case absolute
                case relative
            }
        }
        
        enum Command: Character {
            case move = "M"
            case moveRelative = "m"
            case line = "L"
            case lineRelative = "l"
            case horizontal = "H"
            case horizontalRelative = "h"
            case vertical = "V"
            case verticalRelative = "v"
            case cubic = "C"
            case cubicRelative = "c"
            case cubicSmooth = "S"
            case cubicSmoothRelative = "s"
            case quadratic = "Q"
            case quadraticRelative = "q"
            case quadraticSmooth = "T"
            case quadraticSmoothRelative = "t"
            case arc = "A"
            case arcRelative = "a"
            case close = "Z"
            case closeAlias = "z"
        }
    }
}