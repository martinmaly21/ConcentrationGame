//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Martin Maly on 2018-10-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//
// 

import UIKit

class ViewController: UIViewController {
    

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    var colorChoices = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    var didStartNewGame: Bool = false
    var emoji = [Int:String]()
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card not found")
        }
    }
    
    @IBAction func newGame(_ sender: Any) {
        didStartNewGame = true
        game.flipCount = 0
        for button in cardButtons {
            button.setTitle("", for: .normal)
        }
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    

    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.score)"
        
        if didStartNewGame == true {
            let theme = ConcentrationThemes()
            let randomIndex = Int.random(in: 0...theme.colours.count - 1)
            emojiChoices = theme.emojis[randomIndex]
            colorChoices = theme.colours[randomIndex]
            view.backgroundColor = colorChoices[2]
            flipCountLabel.textColor = colorChoices[1]
            scoreCountLabel.textColor = colorChoices[1]
            newGameButton.setTitleColor(colorChoices[2], for: .normal)
            newGameButton.backgroundColor = colorChoices[1]
            for button in cardButtons {
                button.backgroundColor = colorChoices[1]
            }
            didStartNewGame = false
        }
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = colorChoices[0]
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : colorChoices[1]
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emojiChoices.count > 0 {
            if emoji[card.identifier] == nil {
                let randomIndex = Int.random(in: 0...emojiChoices.count - 1)
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

