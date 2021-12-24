   //
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Luka Lešić on 18.10.2021..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
   @ObservedObject var game: EmojiMemoryGame
    
    @State var emojicount: Int = 6
    var body: some View {
      
       
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))])        {
            ForEach(game.cards) { card in
                
                CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
                
            }
        }
        } .foregroundColor(Color/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
           
            .font(.largeTitle)
            .padding(.horizontal)
        
        
        
        .padding(.horizontal)
       
                 
        }
             
   
 
    
    
    }
    
 
struct CardView: View{
    
    
    let card: MemoryGame<String>.Card
    var body : some View{
        
        ZStack {
        
            
            let shape = RoundedRectangle(cornerRadius: 30)
            if card.isFaceUp {
            shape
                    .strokeBorder(lineWidth : 3)
                    .foregroundColor(.red)
            
            shape
                .fill()
                .foregroundColor(.white)
            
 
                Text(card.content)
                .font(.largeTitle)
                
            } else if card.isMatched{
                shape.opacity(0)
            }
            
            else {
                
                shape
                    .fill()
            }
                    
            }
    }













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
        
}
