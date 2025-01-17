//
//  CardView.swift
//  Set Game
//
//  Created by Petr Kravnik on 17.01.2025.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack {
            switch card.number {
            case .one:
                Spacer()
                feature
                Spacer()
            case .two:
                //Spacer()
                feature
                //Spacer()
                feature
                //Spacer()
            case .three:
                feature
                feature
                feature
            }
        }
        .padding(8)
        .border(Color.black, width: 1)
    }
    
    var shape: some Shape {
        switch card.shape {
        case .diamond: AnyShape(Diamond())
        case .squiggle: AnyShape(Squiggle())
        case .oval: AnyShape(Oval())
        }
    }
    
    private static let outlineWidth: CGFloat = 3.0
    private static let hatchWidth: CGFloat = 1.0
    
    @ViewBuilder
    var feature: some View {
        let shape = shape
        
        switch card.shading {
        case .open:
            shape
                .stroke(card.color.uiColor, lineWidth: CardView.outlineWidth)
        case .striped:
            ZStack {
                shape
                    .stroke(card.color.uiColor, lineWidth: CardView.outlineWidth)
                
                HatchShape()
                    .stroke(card.color.uiColor, lineWidth: CardView.hatchWidth)
                    .clipShape(shape)
            }
        case .solid:
            shape
                .fill(card.color.uiColor)
        }
        
    }
}

extension Card.Color {
    var uiColor: Color {
        switch self {
        case .red: .red
        case .green: .green
        case .blue: .blue
        }
    }
}

#Preview {
    LazyVGrid(columns: [.init(.adaptive(minimum: 50, maximum: 120))]) {
        ForEach(Card.previewCards) { card in
            CardView(card: card)
        }
    }
}
