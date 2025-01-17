//
//  Card.swift
//  Set Game
//
//  Created by Petr Kravnik on 17.01.2025.
//

import Foundation

struct Card: Identifiable {
    enum Shading: CaseIterable {
        case open
        case striped
        case solid
    }

    enum Color: CaseIterable {
        case red
        case green
        case blue
    }
    
    enum Number: CaseIterable {
        case one
        case two
        case three
    }
    
    enum Shape: CaseIterable {
        case diamond
        case squiggle
        case oval
    }
    
    let id = UUID()
    let color: Color
    let number: Number
    let shape: Shape
    let shading: Shading
}

extension Card {
    static var previewCards: [Card] {
        var cards: [Card] = []
        for color in Color.allCases {
            for number in Number.allCases {
                for shape in Shape.allCases {
                    for shading in Shading.allCases {
                        cards.append(Card(color: color, number: number, shape: shape, shading: shading))
                    }
                }
            }
        }
        return cards
    }
}
