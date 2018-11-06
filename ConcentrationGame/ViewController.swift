//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Martin Maly on 2018-10-27.
//  Copyright © 2018 Martin Maly. All rights reserved.
//
// MODEL

import UIKit

class ViewController: UIViewController {
    

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2
    }
    var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    var colorChoices = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    var didStartNewGame: Bool = false
    var emoji = [Int:String]()
    var timer = Timer()
    var counter = 0
    var isFirstClick: Bool = true
    
    
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in cardButtons {
            button.layer.cornerRadius = 8
            
        }
    }
    
    @objc func action() {
        counter += 1
        timerLabel.text = String("Timer: \(counter)")
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        if isFirstClick {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
            promptLabel.text = ""
            isFirstClick = false
        } else {
            timer.invalidate()
            if counter > 3 {
                promptLabel.text = "You took over 3 seconds, an extra point is deducted!"
                game.score = game.score - 1
            }
            counter = 0
            timerLabel.text = "Timer: 0"
            isFirstClick = true
        }
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card not found")
        }
    }
    
    
    @IBAction private func newGame(_ sender: Any) {
        counter = 0
        timer.invalidate()
        didStartNewGame = true
        game.flipCount = 0
        for button in cardButtons {
            button.setTitle("", for: .normal)
        }
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    

    private func updateViewFromModel() {
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
            timerLabel.textColor = colorChoices[1]
            promptLabel.textColor = colorChoices[1]
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
    
    private func emoji(for card: Card) -> String {
        if emojiChoices.count > 0 {
            if emoji[card.identifier] == nil {
                let randomIndex = Int.random(in: 0...emojiChoices.count - 1)
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
}


