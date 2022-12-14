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
        
        let emojis: Array<String> = ["๐ฅณ","๐คฉ","๐ฅธ","๐","๐คช","๐","๐ฅน","๐","๐ค",
                                     "๐","๐","๐คจ","๐ง","๐","๐ข","๐ถ","๐ฌ","๐ฅฑ",
                                     "๐ท","๐คฏ","๐ฅฐ","๐","๐ญ","๐คฅ","๐ค ","๐คซ","๐ค",
                                     "๐ก","๐","๐","๐ฑ","๐ฅถ","๐ซฃ","๐ค"]
        
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
        
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
    func createAnimalMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        let emojis: Array<String> = ["๐ธ","๐ฃ","๐ฆ","๐ฆ","๐ฆ","๐ฆ","๐ฆง","๐ถ","๐ฑ",
                                     "๐น","๐ฐ","๐ท","๐ฅ","๐จ","๐ผ","๐ฎ","๐ฆ","๐ท",
                                     "๐ฆ","๐","๐ ","๐ณ","๐ฌ","๐ฆฅ","๐ฆฉ","๐ฆ","๐ฟ",
                                     "๐ฆ","๐ฆฆ","๐ฆ","๐ฆ","๐","๐"]
        let pairs = getAmountPairs(level: level, arrayCount: emojis.count, screenWidth: screenWidth)
        
        return MemoryGameModel<String>(_pairsOfCards: pairs, _cardContent: {index in return emojis[index]})
    }
    
    func createFoodMemoryGame(level: String, screenWidth: CGFloat) -> MemoryGameModel<String> {
        let emojis: Array<String> = ["๐","๐ฅจ","๐ถ","๐","๐ฅ","๐","๐","๐","๐","๐ง",
                                     "๐ฅ","๐ ","๐ง","๐","๐ฅ","๐ซ","๐","๐ฅช","๐ฅ","๐ฐ",
                                     "๐ช","๐ฉ","๐ฃ","๐","๐","๐ฅฆ","๐ฝ","๐","๐ง","๐ฅ",
                                     "๐ฅ","๐ฎ","๐ซ","๐","๐ฅฅ"]
        
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
