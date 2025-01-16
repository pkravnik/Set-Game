//
//  SquiggleSketch.swift
//  Set Game
//
//  Created by Petr Kravnik on 15.01.2025.
//

import SwiftUI

struct SquiggleSketch: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let verticalSpacing = rect.height / 20
            let horizontalSpacing = rect.width / 20
            
            let p1 = CGPoint(x: rect.midX - 9*horizontalSpacing, y: rect.midY - 7*verticalSpacing)
            let p2 = CGPoint(x: rect.midX + 7*horizontalSpacing, y: rect.midY - 8*verticalSpacing)
            
            let c1 = CGPoint(x: rect.midX - 4*horizontalSpacing, y: rect.midY - 16*verticalSpacing)
            let c2 = CGPoint(x: rect.midX + 1*horizontalSpacing, y: rect.midY + 1*verticalSpacing)
            path.move(to: p1)
            path.addCurve(to: p2, control1: c1, control2: c2)
            
            let p3 = CGPoint(x: rect.midX + 7*horizontalSpacing, y: rect.midY + 6*verticalSpacing)
            let c3 = CGPoint(x: rect.midX + 10*horizontalSpacing, y: rect.midY - 16*verticalSpacing)
            let c4 = CGPoint(x: rect.midX + 12*horizontalSpacing, y: rect.midY - 0*horizontalSpacing)
            path.addCurve(to: p3, control1: c3, control2: c4)
        }
    }
}

struct BezierDots: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let verticalSpacing = rect.height / 20
            let horizontalSpacing = rect.width / 20
            
            let p1 = CGPoint(x: rect.midX - 9*horizontalSpacing, y: rect.midY - 7*verticalSpacing)
            let p2 = CGPoint(x: rect.midX + 7*horizontalSpacing, y: rect.midY - 8.5*verticalSpacing)
            
            let c1 = CGPoint(x: rect.midX - 4*horizontalSpacing, y: rect.midY - 16*verticalSpacing)
            let c2 = CGPoint(x: rect.midX + 1*horizontalSpacing, y: rect.midY + 1*verticalSpacing)
            let p3 = CGPoint(x: rect.midX + 7*horizontalSpacing, y: rect.midY + 6*verticalSpacing)
            let c3 = CGPoint(x: rect.midX + 13*horizontalSpacing, y: rect.midY - 14*verticalSpacing)
            let c4 = CGPoint(x: rect.midX + 11*horizontalSpacing, y: rect.midY + 0*horizontalSpacing)
            path.move(to: p1)
            path.addCurve(to: p2, control1: c1, control2: c2)
            
            path.move(to: p1)
            path.addArc(center: p1, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            path.move(to: p2)
            path.addArc(center: p2, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            path.move(to: c1)
            path.addArc(center: c1, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            path.move(to: c2)
            path.addArc(center: c2, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            
            path.move(to: p3)
            path.addArc(center: p3, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            
            path.move(to: c3)
            path.addArc(center: c3, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
            
            path.move(to: c4)
            path.addArc(center: c4, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        }
    }
}
                          

struct Grid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalSpacing = rect.width / 20
            for x in stride(from: horizontalSpacing, to: rect.width, by: horizontalSpacing) {
                path.move(to: CGPoint(x: x, y: rect.minY))
                path.addLine(to: CGPoint(x: x, y: rect.maxY))
            }
            
            let verticalSpacing = rect.height / 20
            for y in stride(from: verticalSpacing, to: rect.height, by: verticalSpacing) {
                path.move(to: CGPoint(x: rect.minX, y: y))
                path.addLine(to: CGPoint(x: rect.maxX, y: y))
            }
        }
    }
}

struct MyCanvas: View {
    var body: some View {
        ZStack {
//            Image("squiggle")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300)
            Canvas { context, size in
                let horizontalSpacing = 10.0
                let verticalSpacing = 10.0
                let grid = Path { path in
                    for x in stride(from: horizontalSpacing, to: size.width, by: horizontalSpacing) {
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: size.height))
                    }
                    
                    
                    for y in stride(from: verticalSpacing, to: size.height, by: verticalSpacing) {
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: size.width, y: y))
                    }
                }
                context.stroke(grid, with: .color(.gray.opacity(0.3)), lineWidth: 1)
                let midX = size.width / 2
                let midY = size.height / 2
                let origin = Path { path in
                    path.move(to: CGPoint(x: 0, y: midY))
                    path.addLine(to: CGPoint(x: size.width, y: midY))
                    path.move(to: CGPoint(x: midX, y: 0))
                    path.addLine(to: CGPoint(x: midX, y: size.height))
                    
                }
                
                context.stroke(origin, with: .color(.gray), lineWidth: 1)
                
                let d1 = 8.0
                let p1 = CGPoint(x: midX - 10*horizontalSpacing, y: midY + 1*verticalSpacing)
                let c1_1 = CGPoint(x: p1.x, y: p1.y + d1*verticalSpacing)
                let c1_2 = CGPoint(x: p1.x, y: p1.y - d1*verticalSpacing)
                
                let d2 = 4.0
                let p2 = CGPoint(x: midX + 2*horizontalSpacing, y: midY - 3*verticalSpacing)
                let c2_1 = CGPoint(x: p2.x - d2*horizontalSpacing, y: p2.y)
                let c2_2 = CGPoint(x: p2.x + d2*horizontalSpacing, y: p2.y)
                
                let d3 = d1
                let p3 = CGPoint(x: midX + 10*horizontalSpacing, y: midY - 1*verticalSpacing)
                let c3_1 = CGPoint(x: p3.x, y: p3.y - d3*verticalSpacing)
                let c3_2 = CGPoint(x: p3.x, y: p3.y + d3*verticalSpacing)
                
                let d4 = d2
                let p4 = CGPoint(x: midX - 2*horizontalSpacing, y: midY + 3*verticalSpacing)
                let c4_1 = CGPoint(x: p4.x + d4*horizontalSpacing, y: p4.y)
                let c4_2 = CGPoint(x: p4.x - d4*horizontalSpacing, y: p4.y)
//                let c3 = CGPoint(x: midX + 7*horizontalSpacing, y: midY - 2*verticalSpacing)
                let line1 = Path { path in
                    path.move(to: c1_1)
                    path.addLine(to: c1_2)
                }
                context.stroke(line1, with: .color(.blue), lineWidth: 1)
                context.stroke(.dot(at: p1), with: .color(.blue), lineWidth: 2)
                context.stroke(.dot(at: c1_1), with: .color(.purple), lineWidth: 2)
                context.stroke(.dot(at: c1_2), with: .color(.purple), lineWidth: 2)
                
                let line2 = Path { path in
                    path.move(to: c2_1)
                    path.addLine(to: c2_2)
                }
                context.stroke(line2, with: .color(.blue), lineWidth: 1)
                context.stroke(.dot(at: p2), with: .color(.blue), lineWidth: 2)
                context.stroke(.dot(at: c2_1), with: .color(.purple), lineWidth: 2)
                context.stroke(.dot(at: c2_2), with: .color(.purple), lineWidth: 2)
                
                let line3 = Path { path in
                    path.move(to: c3_1)
                    path.addLine(to: c3_2)
                }
                context.stroke(line3, with: .color(.blue), lineWidth: 1)
                context.stroke(.dot(at: p3), with: .color(.blue), lineWidth: 2)
                context.stroke(.dot(at: c3_1), with: .color(.purple), lineWidth: 2)
                context.stroke(.dot(at: c3_2), with: .color(.purple), lineWidth: 2)
                
                let line4 = Path { path in
                    path.move(to: c4_1)
                    path.addLine(to: c4_2)
                }
                context.stroke(line4, with: .color(.blue), lineWidth: 1)
                context.stroke(.dot(at: p4), with: .color(.blue), lineWidth: 2)
                context.stroke(.dot(at: c4_1), with: .color(.purple), lineWidth: 2)
                context.stroke(.dot(at: c4_2), with: .color(.purple), lineWidth: 2)
                
                
                let squiggle1 = Path { path in
                    path.move(to: p1)
                    path.addCurve(to: p2, control1: c1_2, control2: c2_1)
                    path.addCurve(to: p3, control1: c2_2, control2: c3_1)
                    path.addCurve(to: p4, control1: c3_2, control2: c4_1)
                    path.addCurve(to: p1, control1: c4_2, control2: c1_1)
//                    path.addCurve(to: p5, control1: c7, control2: c8)
//                    path.addCurve(to: p6, control1: c9, control2: c10)
//                    path.addCurve(to: p1, control1: c11, control2: c1_2)
                }
                context.stroke(squiggle1, with: .color(.red), lineWidth: 3)
                
//
//                
//                context.stroke(.dot(at: p1), with: .color(.yellow), lineWidth: 2)
//                context.stroke(.dot(at: p2), with: .color(.yellow.opacity(0.5)), lineWidth: 2)
//                context.stroke(.dot(at: c1), with: .color(.yellow), lineWidth: 2)
//                context.stroke(.dot(at: c2), with: .color(.yellow.opacity(0.5)), lineWidth: 2)
//                
                
//                context.stroke(.dot(at: c4), with: .color(.brown), lineWidth: 2)
//
//                
//                context.stroke(.dot(at: c5), with: .color(.green), lineWidth: 2)
//                context.stroke(.dot(at: c6), with: .color(.green.opacity(0.5)), lineWidth: 2)
//                
//                context.stroke(.dot(at: p5), with: .color(.green), lineWidth: 2)
//                context.stroke(.dot(at: p6), with: .color(.green.opacity(0.5)), lineWidth: 2)
                
//                context.stroke(.dot(at: c3), with: .color(.pink), lineWidth: 2)
//                context.stroke(.dot(at: c4), with: .color(.teal), lineWidth: 2)
//                context.stroke(.dot(at: c5), with: .color(.brown), lineWidth: 2)
//                context.stroke(.dot(at: c6), with: .color(.indigo), lineWidth: 2)
//                context.stroke(.dot(at: c7), with: .color(.orange), lineWidth: 2)
//                context.stroke(.dot(at: c8), with: .color(.mint), lineWidth: 2)
                 
            }
        }
    }
}

extension Path {
    static func dot(at point: CGPoint) -> Path {
        var path = Path()
        path.addArc(center: point, radius: 3, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        return path
    }
}

#Preview {
    MyCanvas()
}

/*
 let p1 = CGPoint(x: midX - 12*horizontalSpacing, y: midY - 5*verticalSpacing)
 let p2 = CGPoint(x: midX + 10*horizontalSpacing, y: midY - 6*verticalSpacing)
 
 let c1 = CGPoint(x: midX - 7*horizontalSpacing, y: midY - 10*verticalSpacing)
 let c2 = CGPoint(x: midX + 3*horizontalSpacing, y: midY + 1*verticalSpacing)
 
 let p3 = CGPoint(x: midX + 11*horizontalSpacing, y: midY + 3*verticalSpacing)
 let p4 = CGPoint(x: midX - 8*horizontalSpacing, y: midY + 4*verticalSpacing)
 
 let c3 = CGPoint(x: midX + 14*horizontalSpacing, y: midY - 10*verticalSpacing)
 let c4 = CGPoint(x: midX + 15*horizontalSpacing, y: midY - 1*verticalSpacing)
 
 let c5 = CGPoint(x: midX + 4*horizontalSpacing, y: midY + 10*verticalSpacing)
 let c6 = CGPoint(x: midX - 3*horizontalSpacing, y: midY - 1*verticalSpacing)
 
 let c7 = CGPoint(x: midX - 14*horizontalSpacing, y: midY+10*verticalSpacing)
 let c8 = CGPoint(x: midX - 15*horizontalSpacing, y: midY-2*verticalSpacing)

 let squiggle1 = Path { path in
     path.move(to: p1)
     path.addCurve(to: p2, control1: c1, control2: c2)
     path.addCurve(to: p3, control1: c3, control2: c4)
     path.addCurve(to: p4, control1: c5, control2: c6)
     path.addCurve(to: p1, control1: c7, control2: c8)
 }
 
 context.stroke(squiggle1, with: .color(.red), lineWidth: 3)
 
 
 context.stroke(.dot(at: p1), with: .color(.blue), lineWidth: 2)
 context.stroke(.dot(at: p2), with: .color(.blue), lineWidth: 2)
 context.stroke(.dot(at: c1), with: .color(.yellow), lineWidth: 2)
 context.stroke(.dot(at: c2), with: .color(.green), lineWidth: 2)
 context.stroke(.dot(at: p3), with: .color(.blue), lineWidth: 2)
 context.stroke(.dot(at: p4), with: .color(.blue), lineWidth: 2)
 context.stroke(.dot(at: c3), with: .color(.pink), lineWidth: 2)
 context.stroke(.dot(at: c4), with: .color(.teal), lineWidth: 2)
 context.stroke(.dot(at: c5), with: .color(.brown), lineWidth: 2)
 context.stroke(.dot(at: c6), with: .color(.indigo), lineWidth: 2)
 context.stroke(.dot(at: c7), with: .color(.orange), lineWidth: 2)
 context.stroke(.dot(at: c8), with: .color(.mint), lineWidth: 2)
  
 */
