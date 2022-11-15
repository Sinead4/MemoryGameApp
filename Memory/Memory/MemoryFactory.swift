//
//  MemoryFactory.swift
//  Memory
//
//  Created by Sinead on 27.10.22.
//

import Foundation
import SwiftUI

class MemoryFactory{
    
    var choosedMemory = memoryContent.food
    var amountOfPairs = 0
    
    func getAmountPairs(level: String, arrayCount: Int,  screenWidth: CGFloat)-> Int {
        var pairs: Int
        let boundary = screenWidth / 30
        
        switch level {
        case "Easy":
            pairs = Int(boundary / 4)
        case "Medium":
            pairs = Int(boundary / 2)
        case "Hard":
            pairs = arrayCount
        default:
            pairs = arrayCount
        }
        return pairs
    }
    
    
    func createEmojiMemoryGame(level: String,  screenWidth: CGFloat) -> MemoryGameModel<String> {
        
        let emojis: Array<String> = ["🥳","🤩","🥸","😀","🤪","😅","🥹","😖","😤",
                                     "😋","😉","🤨","🧐","😂","😢","😶","😬","🥱",
                                     "😷","🤯","🥰","😓","😭","🤥","🤠","🤫","🤒",
                                     "😡","🙃","😍","😱","🥶","🫣","🤐"]
        
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
        
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
      func createAnimalMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🐸","🐣","🦊","🦖","🦕","🦑","🦧","🐶","🐱",
                                     "🐹","🐰","🐷","🐥","🐨","🐼","🐮","🦁","🕷",
                                     "🦋","🐝","🐠","🐳","🐬","🦥","🦩","🦚","🐿",
                                     "🦔","🦦","🦇","🦄","🐞","🐌"]
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
          
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
      func createFoodMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        let emojis: Array<String> = ["🍓","🥨","🌶","🍔","🥑","🍎","🍋","🍌","🍉","🧅",
                                     "🥐","🍠","🧀","🍕","🥞","🫐","🍑","🥪","🥗","🍰",
                                     "🍪","🍩","🍣","🍍","🍒","🥦","🌽","🍇","🧄","🥒",
                                     "🥓","🌮","🍫","🍗","🥥"]
          
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
          
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
    
/*    private static func createFormsMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<Shape> {
        var star = Star(corners: 5, smoothness: 0.45)
        
        
        
        let forms: Array<any Shape> = [star]
        
        let pairs = getAmountPairs(level: level, arrayCount: forms.count, screenWidth: screenWidth)
        
        return MemoryGameModel<String>(_pairsOfCards: forms.count, _cardContent: {index in return forms[index]})
        
    }
 */
    

    
}

enum memoryContent{
    case animal
    case food
    case forms
    case emoji
    
}
