//
//  MemoryViewModel.swift
//  Memory
//
//  Created by Sinead on 10.11.22.
//

import Foundation
import SwiftUI

class MemoryViewModel: ObservableObject{

    var memory = "emoji"
    var score : Int {
        model.score
    }

    @Published var model: MemoryGameModel<String>
//    @ObservedObject var model: MemoryGameModel<Shape>
    
    
    init(){
        model = MemoryGameModel<String>()
        
//        if(memory == "shape"){
//            objectWillChange.send()
//            score = MemoryGameModel<CardContent: Shape>().getScore()
//        }
//        objectWillChange.send()
        
        print("Score ist in init: ")
//        print(score)
    }
    
    
//    var model = MemoryGameModel<CardContent>(_pairsOfCards: 3, _cardContent: <#(Int) -> _#>)
//    var whichMemory: String
//    var width: CGFloat
//    var gameLevel: String
//    var viewModel: MemoryViewModel
//    var cards: Array<MemoryGameModel<String>.Card>
//
//
//    init(choosenMemory: String, level: String, screenWidth: CGFloat){
//        whichMemory = choosenMemory
//        gameLevel = level
//        width = screenWidth
//        
//        if(whichMemory == "shape"){
//            viewModel = ShapeMemoryViewModel(choosenMemory: whichMemory, level: gameLevel, screenWidth: width)
//            cards = viewModel.cards
//        }else{
//            viewModel = EmojiMemoryViewModel(level: gameLevel, memory: whichMemory, screenWidth: width)
//            cards = viewModel.cards
//
//        }
//    }


  //  var cards: Array<MemoryGameModel<?>.Card>{
   //     return viewModel.cards
  //  }
    
  //  func choose(card: MemoryGameModel<Any>.Card){
 //       objectWillChange.send()
 //       viewModel.choose(card: card)
 //   }
    
//    func updateScore(){
//        score = (memory=="shape") ? 0 : MemoryGameModel<String>().score
//        print("in updateScore score is:")
//        print(score)
//    }
    
    
    
//    func getScore()-> Int{
//        if(memory == "shape"){
//            objectWillChange.send()
////            score = MemoryGameModel<CardContent: Shape>().getScore()
////            return score
//        }
//        objectWillChange.send()
//        print("Score ist: ")
//        print(MemoryGameModel<String>().score)
//        score = MemoryGameModel<String>().score
//        return score
//    }

}



