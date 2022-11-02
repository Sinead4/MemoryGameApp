//
//  EmojiMemoryViewModel.swift
//  Memory
//
//  Created by Sinead on 05.10.22.
//

import Foundation
import SwiftUI

class EmojiMemoryViewModel: ObservableObject{
    
//    das Published macht das das UI neu gezeichnet wird wenn diese Proberty sich ändert
    @Published private var emojiModel: MemoryGameModel<String>

    var factory = MemoryFactory()
    
    init(){
        emojiModel = factory.startCorrectGame()
    }
    
    var cards: Array<MemoryGameModel<String>.Card>{
        return emojiModel.cards
    }
    
    func choose(card: MemoryGameModel<String>.Card){
        objectWillChange.send()
        emojiModel.choose(card: card)
    }
    
    func startGame() -> MemoryGameModel<String>{
        emojiModel = factory.startCorrectGame()
        return emojiModel
    }
    
    
}
