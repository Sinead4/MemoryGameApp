//
//  MemoryFactory.swift
//  Memory
//
//  Created by Sinead on 27.10.22.
//

import Foundation

class MemoryFactory{
    
    
    var choosedMemory = memoryContent.food
    var amountOfPairs = 0
    
 /*   private static func createFormsMemoryGame() -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🥳","🤩","🥸","😸","🤖","🕵️‍♀️","","","","","","","","","","","","","","","","",""]
        return MemoryGameModel<String>(_pairsOfCards: emojis.count, _cardContent: {index in return emojis[index]})
        
    }
  */
    func getAmountPairs(level: String, arrayCount: Int,  screenWidth: CGFloat)-> Int {
        var pairs: Int
        var maxOfPairs = screenWidth / 30
        
        switch level {
        case "Easy":
            pairs = Int(maxOfPairs / 4)
            
        case "Medium":
            pairs = Int(maxOfPairs / 2)
        case "Hard":
            pairs = arrayCount
        default:
            pairs = arrayCount
        }
        return pairs
    }
    // mit geometry screen size lesen im view aber
    
    func calculateCardSize(width: CGFloat, height: CGFloat, amountPairs: Int, array: Array<String>)->Int{
        
        let sizeCard = (amountPairs*2) / Int(width * height)
        
        if(sizeCard < 20){
            //array.remove(at: 0)
        }
        
        
        return 2
    }
    
    
    func createEmojiMemoryGame(level: String,  screenWidth: CGFloat) -> MemoryGameModel<String> {
        
        var emojis: Array<String> = ["🥳","🤩","🥸","😀","🤪","😅","🥹","😖","😤",
                                     "😋","😉","🤨","🧐","😂","😢","😶","😬","🥱",
                                     "😷","🤯","🥰","😓","😭","🤥","🤠","🤫","🤒",
                                     "😡","🙃","😍","😱","🥶","🫣","🤐"]
        
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
        
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
      func createAnimalMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        var emojis: Array<String> = ["🐸","🐣","🦊","🦖","🦕","🦑","🦧","🐶","🐱",
                                     "🐹","🐰","🐷","🐥","🐨","🐼","🐮","🦁","🕷",
                                     "🦋","🐝","🐠","🐳","🐬","🦥","🦩","🦚","🐿",
                                     "🦔","🦦","🦇","🦄","🐞","🐌"]
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
          
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
      func createFoodMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        var emojis: Array<String> = ["🍓","🥨","🌶","🍔","🥑","🍎","🍋","🍌","🍉","🧅",
                                     "🥐","🍠","🧀","🍕","🥞","🫐","🍑","🥪","🥗","🍰",
                                     "🍪","🍩","🍣","🍍","🍒","🥦","🌽","🍇","🧄","🥒",
                                     "🥓","🌮","🍫","🍗","🥥"]
          
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
          
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
    
}

enum memoryContent{
    case animal
    case food
    case forms
    case emoji
    
}
