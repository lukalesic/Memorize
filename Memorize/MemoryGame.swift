//
//  MemoryGame.swift
//  Memorize
//
//  Created by Luka Lešić on 05.11.2021..
//

import Foundation





struct MemoryGame<CardContent> where CardContent: Equatable //equatable da mogu 
{
    
   private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?

   mutating func choose(_ card: Card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
               if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               else{
                   
                   for index in 0..<cards.count{
                       cards[index].isFaceUp = false
                   }
                   indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                   
               }           }
           
           cards[chosenIndex].isFaceUp.toggle()}
        print("\(cards)")
            
        
    }
    func index(of card: Card)-> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card> ()
        //add numberofpairsofcards*2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards{
            
            let content: CardContent = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))

           

            
            
        }
        
    
    }
    
    struct Card: Identifiable {
        //structs inside structs ("MemoryGame.Card" kad se poziva izvana) // identifiable jer se koristi za foreach kasnije
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent //this is a generic type, preda se neki tip kod stvaranja structa
        let id: Int

    }
}
