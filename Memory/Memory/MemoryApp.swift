//
//  MemoryApp.swift
//  Memory
//
//  Created by Sinead on 22.09.22.
//

import SwiftUI

@main
struct MemoryApp: App {
    
    var body: some Scene {
        WindowGroup {
            MemoryGameView(emojiViewModel: EmojiMemoryViewModel(level: "easy", memory: "emoji", screenWidth: UIScreen.main.bounds.width))
        }
    }
}
