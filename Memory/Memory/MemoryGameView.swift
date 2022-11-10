//
//  ContentView.swift
//  Memory
//
//  Created by Sinead on 22.09.22.
//

import SwiftUI

//some gibt an hey innerhalb ist was komplexes finde selber raus wie du eine view zurückgibst
struct MemoryGameView: View {
    
//    was soll beobachtet werden
    @ObservedObject
    var viewModel: EmojiMemoryViewModel
    
    
    var body: some View {
        MenuContentView(model: viewModel)
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumColumnWidth))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(cardAspectRatio, contentMode: .fill)
                            .onTapGesture {
                                withAnimation(.linear(duration: rotationDuration)) {
                                    self.viewModel.choose(card: card)
                                }
                        }
                    }
                }.foregroundColor(Color.blue)
            }.padding(.horizontal)

        }
    }
    
    func getColumnWidth(){
        var screenWidth = UIScreen.main.bounds.width
        var screenHeight = UIScreen.main.bounds.height
        
        
    }
    
    // MARK: - Drawing Constants
    private let minimumColumnWidth = Double(65)
    private let rotationDuration = Double(0.75)
    private let cardAspectRatio = CGFloat(0.7)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryViewModel(screenWidth: UIScreen.main.bounds.width)
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
