//
//  Card.swift
//  ConcentrationGame
//
//  Created by Martin Maly on 2018-10-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//
// CONTROLLER

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        //whenever a card is initialized it is given an identifier which is increasing by one each time
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
