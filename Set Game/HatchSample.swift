//
//  HatchSample.swift
//  Set Game
//
//  Created by Petr Kravnik on 16.01.2025.
//

import SwiftUI

struct HatchSample: View {
    var body: some View {
        ZStack {
            let shape = Oval()
            shape
                .stroke(Color.blue, lineWidth: 3)
            
            HatchShape()
                .stroke(Color.gray, lineWidth: 1)
                .clipShape(shape)
        }
        .aspectRatio(2.5, contentMode: .fit)
        .frame(width: 200)
        
    }
}

struct HatchShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            for x in stride(from: 0.0, through: rect.width, by: 8.0) {
                path.move(to: CGPoint(x: x, y: rect.minY))
                path.addLine(to: CGPoint(x: x, y: rect.maxY))
            }
        }
    }
}

#Preview {
    HatchSample()
}
