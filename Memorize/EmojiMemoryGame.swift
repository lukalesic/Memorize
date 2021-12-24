//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Luka Lešić on 05.11.2021..
//

import SwiftUI






class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
private static let emojis = ["🚅","🛬","🚀","🚂", "🛩", "🛸", "🛥", "🗿", "🛶", "🚄", "🚋"]

  private  static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 3) {pairIndex in EmojiMemoryGame.emojis[pairIndex]
                
            }

        
        
    }
    
    
    
   @Published private var model = EmojiMemoryGame.createMemoryGame() // tu se poziva na model, instancira ga, ovaj published znaci salje se obavijest svemu kad se model promjeni
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
        
    }
    
 
    
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
        
    }
    
}
