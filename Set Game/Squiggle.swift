//
//  Squiggle.swift
//  Set Game
//
//  Created by Petr Kravnik on 16.01.2025.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let p1 = CGPoint(x: rect.minX, y: rect.midY + rect.height / 10.4)
        let c1_1 = CGPoint(x: p1.x, y: p1.y + rect.height / 1.3)
        let c1_2 = CGPoint(x: p1.x, y: p1.y - rect.height / 1.3)
        
        let p2 = CGPoint(x: rect.midX + rect.width/10, y: rect.midY - rect.height / 3.6)
        let c2_1 = CGPoint(x: p2.x - rect.width / 5, y: p2.y)
        let c2_2 = CGPoint(x: p2.x + rect.width / 5, y: p2.y)
        
        let p3 = CGPoint(x: rect.maxX, y: rect.midY - rect.height / 10.4)
        let c3_1 = CGPoint(x: p3.x, y: p3.y - rect.height / 1.3)
        let c3_2 = CGPoint(x: p3.x, y: p3.y + rect.height / 1.3)
        
        let p4 = CGPoint(x: rect.midX - rect.width/10, y: rect.midY + rect.height / 3.6)
        let c4_1 = CGPoint(x: p4.x + rect.width / 5, y: p4.y)
        let c4_2 = CGPoint(x: p4.x - rect.width / 5, y: p4.y)
        
        return Path { path in
            path.move(to: p1)
            path.addCurve(to: p2, control1: c1_2, control2: c2_1)
            path.addCurve(to: p3, control1: c2_2, control2: c3_1)
            path.addCurve(to: p4, control1: c3_2, control2: c4_1)
            path.addCurve(to: p1, control1: c4_2, control2: c1_1)
        }
    }
}

#Preview {
    ZStack {
        Rectangle()
            .stroke(Color.black, lineWidth: 1)
        Squiggle()
            .stroke(Color.blue, lineWidth: 3)
            
    }
    .frame(width: 330, height: 150)
}
