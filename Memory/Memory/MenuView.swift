//
//  MenuView.swift
//  Memory
//
//  Created by Sinead on 06.10.22.
//

import SwiftUI

struct MenuContentView: View {
    @State private var showingSheet = true
    var model : EmojiMemoryViewModel


    var body: some View {
        Button("New Game") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            MenuView(emojiViewModel: model)
        }
    }
}

struct MenuView: View {
    @Environment(\.dismiss) var dismiss

    var emojiViewModel: EmojiMemoryViewModel
   //var shapeModel: ShapeMemoryViewModel
    var factory = MemoryFactory()

    
    var body: some View {
        Text("Choose Game Content")
        Button (action: {
                withAnimation(.easeInOut){
                    emojiViewModel.chooseEmoji()
                    dismiss()
                }
            }, label: {Text("Emoji")})
        Button (action: {
                withAnimation(.easeInOut){
                    emojiViewModel.chooseAnimals()
                    dismiss()
                }
            }, label: {Text("Animals")})
        Button (action: {
                withAnimation(.easeInOut){
                    emojiViewModel.chooseFood()
                    dismiss()
                }
            }, label: {Text("Food")})
        Button (
            action: {
                withAnimation(.easeInOut){
                    //toDO
                    //dismiss()
                }
            }, label: {Text("Forms")})
        
        Button("Close") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct GameContentSheet: View {
    var model: EmojiMemoryViewModel
    var factory = MemoryFactory()
    
    var body: some View {
        Button (action: {
                withAnimation(.easeInOut){
                    factory.choosedMemory = memoryContent.emoji
                }
            }, label: {Text("Emoji")})
        Button (action: {
                withAnimation(.easeInOut){
                    factory.choosedMemory = memoryContent.animal
                }
            }, label: {Text("Animals")})
        Button (action: {
                withAnimation(.easeInOut){
                    factory.choosedMemory = memoryContent.food
                }
            }, label: {Text("Food")})
        Button (
            action: {
                withAnimation(.easeInOut){
                    factory.choosedMemory = memoryContent.forms
                }
            }, label: {Text("Forms")})
        

        
    }
    
}




/*
struct MenuView: View{
    
        var body: some View {

                Menu("Hello") {
                    Button("World", action: {
                        print("Hello World")
                    })
                    Button("Earth", action: {})
                }
                
            }
    }
    
*/
