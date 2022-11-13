//
//  Star.swift
//  Memory
//
//  Created by Sinead on 25.10.22.
//

import SwiftUI

struct Star: Shape, Equatable {

    
    let corners: Int
    let smoothness: Double
    let color: Color

    
        func path(in rect: CGRect) -> Path {
            
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

            var currentAngle = -CGFloat.pi / 2

            // calculate how much we need to move with each star corner
            let angleAdjustment = .pi * 2 / Double(corners * 2)

            // figure out how much we need to move X/Y for the inner points of the star
            let innerX = center.x * smoothness
            let innerY = center.y * smoothness

            var path = Path()

            // move to our initial position
            path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

            // track the lowest point we draw to, so we can center later
            var bottomEdge: Double = 0

            // loop over all our points/inner points
            for corner in 0..<corners * 2  {
                // figure out the location of this point
                let sinAngle = sin(currentAngle)
                let cosAngle = cos(currentAngle)
                let bottom: Double

                // if we're a multiple of 2 we are drawing the outer edge of the star
                if corner.isMultiple(of: 2) {
                    // store this Y position
                    bottom = center.y * sinAngle

                    // …and add a line to there
                    path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
                } else {
                    // we're not a multiple of 2, which means we're drawing an inner point

                    // store this Y position
                    bottom = innerY * sinAngle

                    // …and add a line to there
                    path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
                }

                // if this new bottom point is our lowest, stash it away for later
                if bottom > bottomEdge {
                    bottomEdge = bottom
                }

                // move on to the next corner
                currentAngle += angleAdjustment
            }

            // figure out how much unused space we have at the bottom of our drawing rectangle
            let unusedSpace = (rect.height / 2 - bottomEdge) / 2

            // create and apply a transform that moves our path down by that amount, centering the shape vertically
            let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
            
            return path.applying(transform).fill(color) as! Path
        }
    
        static func == (lhs: Star, rhs: Star) -> Bool {
            return lhs.color == rhs.color && lhs.corners == rhs.corners
        }
    }
/*
struct Polygon: Shape, Equatable{
    var sides: Int
    var color: Color
    
    func path(in rect: CGRect) -> Path {
        let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
                let r = Double(min(rect.width,rect.height)) / 2.0
                var vertices:[CGPoint] = []
                for i in 0...sides {
                    let angle = (2.0 * Double.pi * Double(i)/Double(sides))
                    let pt = Cartesian(length: r, angle: angle)
                    
                    vertices.append(CGPoint(x: pt.x + c.x, y: pt.y + c.y))
                }
                var path = Path()
                for (n, pt) in vertices.enumerated() {
                    print("\(n)   vertices.append(CGPoint(x: \(pt.x), y:\(pt.y)))")
                    n == 0 ? path.move(to: pt) : path.addLine(to: pt)
                }
        path.closeSubpath()
        return path.fill(color) as! Path
    }
    
    static func == (lhs: Polygon, rhs: Polygon) -> Bool {
        return lhs.sides == rhs.sides && lhs.color == rhs.color
    }
    
}

func Cartesian(length:Double, angle:Double) -> CGPoint {
    return CGPoint(x: length * cos(angle), y: length * sin(angle))
}

struct RandomPolygonShape: Shape, Equatable {
    var sides:Int
    var color: Color
    
    func path(in rect: CGRect) -> Path {
        let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        let r = Double(min(rect.width,rect.height)) / 2.0
        let vertices = CreateRandomPolygon(
            sides: sides,
            radius: r,
            center: c)
        var path = Path()
        for (n, pt) in vertices.enumerated() {
            n == 0 ? path.move(to: pt) : path.addLine(to: pt)
        }
        path.closeSubpath()
        return path.fill(color) as! Path
    }
    
    static func == (lhs: RandomPolygonShape, rhs: RandomPolygonShape) -> Bool {
        return lhs.sides == rhs.sides && lhs.color == rhs.color
    }
}

fileprivate func CreateRandomPolygon(sides:Int,radius r: Double,center c:CGPoint) -> [CGPoint] {
    var vertices:[CGPoint] = []
    for i in 0..<sides {
        let angle = (2.0 * Double.pi * Double(i)/Double(sides))
        let radius = Double.random(in: r/3.0...r)
        let pt = Cartesian(length: radius, angle: angle)
    // Move the point relative to the center of the rect and add to vertices
        vertices.append(CGPoint(x: pt.x + c.x, y: pt.y + c.y))
    }
    vertices.append(vertices[0])
    return vertices
}
  */
extension Shape where Self : Equatable {
    
    func isEqualTo(other: any Shape) -> Bool {
        if let o = other as? Self {
            return self == o
        }
        
        if let star1 = self as? Star, let star2 = other as? Star {
            return star1.color == star2.color
        }
        
/*        if let poly1 = self as? Polygon, let poly2 = other as? Polygon {
            return poly1.color == poly2.color && poly1.sides == poly2.sides
        }
        
        if let randPoly1 = self as? RandomPolygonShape, let randPoly2 = other as? RandomPolygonShape {
            return randPoly1.color == randPoly2.color && randPoly1.sides == randPoly2.sides
        }
*/
        return false
    }
}
    

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star(corners: 5, smoothness: 0.45, color: Color.red)
            .frame(width: 200, height: 200)
           
    }
}
