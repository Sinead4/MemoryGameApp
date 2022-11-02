//
//  ShapeMemoryViewModel.swift
//  Memory
//
//  Created by Sinead on 26.10.22.
//

import Foundation
import SwiftUI
/*
class ShapeMemoryViewModel: ObservableObject {
    
    @Published private var shapesModel: MemoryGameModel<ComparableShape>
    
    init(){
        shapesModel = EmojiMemoryViewModel.createFormsMemoryGame()
    }
    
    
    private static func createFormsMemoryGame() -> MemoryGameModel<Shape> {
        var star = Star(corners: 5, smoothness: 0.45)
        let forms: Array<any Shape> = [star]
        return MemoryGameModel<String>(_pairsOfCards: forms.count, _cardContent: {index in return forms[index]})
        
    }
    
    var cards: Array<MemoryGameModel<Shape>.Card>{
        return emojiModel.cards
    }
    
    func choose(card: MemoryGameModel<Shape>.Card){
        objectWillChange.send()
        emojiModel.choose(card: card)
    }
    

    
    
}
*/
