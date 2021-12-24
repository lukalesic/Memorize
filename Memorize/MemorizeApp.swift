//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Luka Lešić on 06.10.2021..
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame() 
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
