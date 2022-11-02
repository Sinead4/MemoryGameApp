//
//  MemoryFactory.swift
//  Memory
//
//  Created by Sinead on 27.10.22.
//

import Foundation

class MemoryFactory{
    
    var choosedMemory = memoryContent.food
    
 /*   private static func createFormsMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🥳","🤩","🥸","😸","🤖","🕵️‍♀️","🐸","🐣","🦊","🦖","🦕","🦑","🦧","🦚","🏀"]
        return MemoryGameModel<String>(_pairsOfCards: emojis.count, _cardContent: {index in return emojis[index]})
        
    }
  */
      func createEmojiMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🥳","🤩","🥸","😸","🤖","🕵️‍♀️","🐸","🐣","🦊","🦖","🦕","🦑","🦧","🦚","🏀"]
        return MemoryGameModel<String>(_pairsOfCards: emojis.count, _cardContent: {index in return emojis[index]})
        
    }
    
      func createAnimalMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🐸","🐣","🦊","🦖","🦕","🦑","🦧"]
        return MemoryGameModel<String>(_pairsOfCards: emojis.count, _cardContent: {index in return emojis[index]})
        
    }
    
      func createFoodMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🍓","🥨","🌶","🍔","🥑"]
        return MemoryGameModel<String>(_pairsOfCards: emojis.count, _cardContent: {index in return emojis[index]})
        
    }
    
    func startCorrectGame() -> MemoryGameModel<String>{
        switch choosedMemory{
            case .emoji:
                print("hallo emoji")
                return createEmojiMemoryGame()
            case .animal:
                print("hallo animal")
                return createAnimalMemoryGame()
            case .food:
                print("hallo food")
                return createFoodMemoryGame()

            case .forms:
                print("FU")
            return createEmojiMemoryGame()
                //DO nothing
        }
    }
    
}

enum memoryContent{
    case animal
    case food
    case forms
    case emoji
    
}
