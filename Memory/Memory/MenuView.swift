//
//  MenuView.swift
//  Memory
//
//  Created by Sinead on 06.10.22.
//

import SwiftUI

struct MenuContentView: View {
    @State private var showingSheet = true
    @State var model : EmojiMemoryViewModel


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
//    var shapeModel: ShapeMemoryViewModel
           var factory = MemoryFactory()
           var screenWidth = UIScreen.main.bounds.width
    @State var levelSelection : levels = .easy
    
//    @State var viewModel: MemoryViewModel
    
    var body: some View {
        Title(title: "Memory Game")
        SubTitle(title: "1. Choose your level")
        Picker("", selection: $levelSelection) {
                    ForEach(levels.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
        
        SubTitle(title: "2. Choose your favorite memory deck")
        Button (action: {
                withAnimation(.easeInOut){
//                    viewModel = MemoryViewModel(choosenMemory: "emoji", level: levelSelection.rawValue, screenWidth: screenWidth)
//                    emojiViewModel.startCorrectGame(choosenMemory: "emoji", level: levelSelection.rawValue, screenWidth: screenWidth)
                    //create model
                    emojiViewModel.chooseEmoji(level: levelSelection.rawValue, screenWidth: screenWidth)
                    dismiss()
                }
        }, label: {ContentText(title: "Emoji")})
        .buttonStyle(GrowingButton())
        
        Button (action: {
                withAnimation(.easeInOut){
//                    viewModel = MemoryViewModel(choosenMemory: "animal", level: levelSelection.rawValue, screenWidth: screenWidth)
                    emojiViewModel.chooseAnimals(level: levelSelection.rawValue, screenWidth: screenWidth)
                    dismiss()
                }
            }, label: {ContentText(title: "Animals")})
        Button (action: {
                withAnimation(.easeInOut){
//                    viewModel = MemoryViewModel(choosenMemory: "food", level: levelSelection.rawValue, screenWidth: screenWidth)
                    emojiViewModel.chooseFood(level: levelSelection.rawValue, screenWidth: screenWidth)
                    dismiss()
                }
            }, label: {ContentText(title: "Food")})
        Button (
            action: {
                withAnimation(.easeInOut){
//                    shapeModel.chooseForms(level: levelSelection.rawValue, screenWidth: screenWidth)
//                    dismiss()
                }
            }, label: {ContentText(title: "Forms")})
        
        
        
        Button("Close") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}




struct SubTitle: View {
  let title: String

  var body: some View {
    Text(title)
    .font(.headline)
    .fontWeight(.medium)
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct Title: View {
  let title: String

  var body: some View {
    Text(title)
      .font(.title)
      .fontWeight(.bold)
      .padding()
      .multilineTextAlignment(.center)
  }
}

struct ContentText: View {
  let title: String

  var body: some View {
    Text(title)
          .font(.system(.callout, design: .rounded))
      .fontWeight(.bold)
      .padding()
      .multilineTextAlignment(.leading)
  }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
