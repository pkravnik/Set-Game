//
//  Oval.swift
//  Set Game
//
//  Created by Petr Kravnik on 15.01.2025.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            if rect.width > rect.height {
                let halfLength = (rect.width - rect.height) / 2
                path.move(to: CGPoint(x: rect.midX + halfLength, y: rect.minY))
                path.addArc(center: CGPoint(x: rect.midX + halfLength, y: rect.midY), radius: rect.height / 2, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                path.addLine(to: CGPoint(x: rect.midX - halfLength, y: rect.maxY))
                path.addArc(center: CGPoint(x: rect.midX - halfLength, y: rect.midY), radius: rect.height / 2, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: false)
            } else {
                let halfLength = (rect.height - rect.width) / 2
                path.move(to: CGPoint(x: rect.minX, y: rect.midY - halfLength))
                path.addArc(center: CGPoint(x: rect.midX, y: rect.midY - halfLength), radius: rect.width / 2, startAngle: .degrees(-180), endAngle: .degrees(0), clockwise: false)
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY + halfLength))
                path.addArc(center: CGPoint(x: rect.midX, y: rect.midY + halfLength), radius: rect.width / 2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
            }
            path.closeSubpath()
        }
    }
}

#Preview {
    VStack {
        Oval()
            .frame(width: 300, height: 200)
        
        Oval()
            .frame(width: 200, height: 300)
    }
}
