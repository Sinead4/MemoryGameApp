//
//  MemoryFactory.swift
//  Memory
//
//  Created by Sinead on 27.10.22.
//

import Foundation
import SwiftUI

class MemoryFactory{
    
    var amountOfPairs = 0
    
    func getAmountPairs(level: String, arrayCount: Int,  screenWidth: CGFloat)-> Int {
        var pairs: Int
        let boundary = screenWidth / 20
        
        switch level {
        case "Easy":
            pairs = Int(boundary / 3)
        case "Medium":
            pairs = Int(boundary / 1.5)
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
    
    
    func createFormsMemoryGame(level: String, screenWidth: CGFloat) {
        //       let starRed = Star(corners: 5, smoothness: 0.45, color: Color.red) as any Equatable
        //       let starBlue = Star(corners: 5, smoothness: 0.45, color: Color.blue) as any Equatable
        //
        //        let forms: Array<(any Equatable)> = [starRed, starBlue]
        //
        //        let pairs = getAmountPairs(level: level, arrayCount: forms.count, screenWidth: screenWidth)
        
        //        return MemoryGameModel(_pairsOfCards: forms.count,
        //                               _cardContent: {index in
        //            return forms[index] as! cardItem})
    }
}
