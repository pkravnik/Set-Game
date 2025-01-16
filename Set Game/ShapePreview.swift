//
//  ShapePreview.swift
//  Set Game
//
//  Created by Petr Kravnik on 15.01.2025.
//

import SwiftUI

struct ShapePreview: View {
    let aspectRatio: CGFloat = 2.3/1
    var body: some View {
        VStack {
            Diamond()
                .stroke(Color.red, lineWidth: 3)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Oval()
                .stroke(Color.blue, lineWidth: 3)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Squiggle()
                .stroke(Color.green, lineWidth: 3)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ShapePreview()
}
