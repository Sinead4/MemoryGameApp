//
//  EmojiMemoryViewModel.swift
//  Memory
//
//  Created by Sinead on 05.10.22.
//

import Foundation


class EmojiMemoryViewModel: ObservableObject{
    
//    das Published macht das das UI neu gezeichnet wird wenn diese Proberty sich ändert
    @Published private var model: MemoryGameModel<String>
    var factory: MemoryFactory
    
    init(level: String, memory: String, screenWidth: CGFloat){
        self.factory = MemoryFactory()
        self.model = factory.createEmojiMemoryGame(level: "Easy", screenWidth: screenWidth)
        print("im in emojiModel")
    }
    
    var score : Int {
        model.score
    }

    var cards: Array<MemoryGameModel<String>.Card>{
        return model.cards
    }
    
    func choose(card: MemoryGameModel<String>.Card){
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func chooseEmoji(level: String,  screenWidth: CGFloat){
        model = factory.createEmojiMemoryGame(level: level, screenWidth: screenWidth)
    }
    func chooseAnimals(level: String, screenWidth: CGFloat){
        model = factory.createAnimalMemoryGame(level: level, screenWidth: screenWidth)
    }
    func chooseFood(level: String, screenWidth: CGFloat){
        model = factory.createFoodMemoryGame(level: level, screenWidth: screenWidth)
    }
    
}
