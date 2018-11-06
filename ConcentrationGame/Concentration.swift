//

//my issue is that does the cards array index have to be the same as the cardButtons index 

//  Concentration.swift
//  ConcentrationGame
//
//  Created by Martin Maly on 2018-10-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var flipCount = 0
    var score = 0
    var viewedCardsIndex = [Int]()
    var lastEventTime: Date?
//    var isFirstClick: Bool = true
//    var time1: Date?
//    var time2: Date?
    var totalTimeBetween: Double = 0

  
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                    return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    

    
    func chooseCard(at index: Int) {
    
//        if isFirstClick {
//            time1 = Date()
//        } else {
//            time2 = Date()
//            print("time1: \(time1!) , time2: \(time2!)")
//            totalTimeBetween = time2!.timeIntervalSince(time1!)
//            time1 = nil
//            time2 = nil
//        }
//        isFirstClick = !isFirstClick
        
        flipCount += 1
        if  cards[index].isMatched == false {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
//                    if totalTimeBetween < 1 {
//                        score += 5
//                    } else if totalTimeBetween < 2 {
//                        score += 3
//                    } else {
                        score += 5
//                    }
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        if viewedCardsIndex.contains(index) {
            score -= 1
        }
        viewedCardsIndex.append(index)
    }
    
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
}
